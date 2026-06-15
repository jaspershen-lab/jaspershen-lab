#!/usr/bin/env ruby
# frozen_string_literal: true

require "open3"
require "shellwords"
require "cgi"

ROOT = File.expand_path("..", __dir__)
PUBLICATION_DIR = File.join(ROOT, "content", "publication")
SCHOLAR_PROFILE = "https://scholar.google.com/citations?user=3TK9yz8AAAAJ&hl=en&cstart=%<start>d&pagesize=100"

def scholar_url(frontmatter)
  value = frontmatter.lines.find { |line| line.include?("https://scholar.google.com/citations?") }&.split("url:", 2)&.last&.strip
  clean_url(value)
end

def clean_url(value)
  return nil unless value

  cleaned = value.to_s.strip
  4.times do
    cleaned = cleaned.gsub(/\A['"]|['"]\z/, "")
    cleaned = cleaned.gsub(/\\"/, "\"")
  end
  cleaned.empty? ? nil : cleaned
end

def yaml_quote(value)
  "\"#{value.to_s.gsub("\\", "\\\\\\").gsub("\"", "\\\"")}\""
end

def citation_count(url)
  cmd = [
    "curl",
    "-L",
    "-A", "Mozilla/5.0",
    "--max-time", "20",
    url
  ].shelljoin
  html, status = Open3.capture2e(cmd)
  return nil unless status.success?

  html[/Cited by\s+([0-9,]+)/, 1]&.delete(",")
end

def curl(url)
  cmd = [
    "curl",
    "-L",
    "-A", "Mozilla/5.0",
    "--max-time", "20",
    url
  ].shelljoin
  html, status = Open3.capture2e(cmd)
  status.success? ? html : ""
end

def normalize_title(value)
  value.to_s.downcase.gsub(/&[a-z]+;/, " ").gsub(/[^a-z0-9]+/, " ").strip
end

def profile_citations
  rows = {}
  [0, 100, 200].each do |start|
    html = curl(format(SCHOLAR_PROFILE, start: start))
    break if html.empty?

    html.scan(%r{<tr class="gsc_a_tr">(.*?)</tr>}m).each do |row_match|
      row = row_match.first
      title = row[%r{<a[^>]*class="gsc_a_at"[^>]*>(.*?)</a>}m, 1]
      citations = row[%r{<a[^>]*class="gsc_a_ac[^"]*"[^>]*>(.*?)</a>}m, 1]
      url = row[%r{<a[^>]*class="gsc_a_at"[^>]*href="([^"]+)"}m, 1]
      next unless title

      title = CGI.unescapeHTML(title.gsub(/<[^>]+>/, ""))
      citations = CGI.unescapeHTML((citations || "0").gsub(/<[^>]+>/, "")).strip
      citations = "0" if citations.empty? || citations == "*"
      url = "https://scholar.google.com#{CGI.unescapeHTML(url)}" if url&.start_with?("/")
      url = clean_url(url)

      key = normalize_title(title)
      existing = rows[key]
      if existing.nil? || citations.to_i > existing[:count].to_i
        rows[key] = { count: citations, url: url, title: title }
      end
    end
    sleep 1
  end
  rows
end

def upsert_frontmatter_value(frontmatter, key, value)
  line = "#{key}: #{value}\n"
  if frontmatter.match?(/^#{Regexp.escape(key)}:/)
    frontmatter.sub(/^#{Regexp.escape(key)}:.*\n/, line)
  else
    frontmatter.sub(/\A---\n/, "---\n#{line}")
  end
end

profile_rows = profile_citations

Dir.glob(File.join(PUBLICATION_DIR, "**", "index.md")).sort.each do |path|
  text = File.read(path)
  next unless text.start_with?("---\n")

  parts = text.split(/^---\s*$/, 3)
  next unless parts.length >= 3

  frontmatter = "---#{parts[1]}---\n"
  body = parts[2]
  title = frontmatter[/^title:\s*"?(.+?)"?\s*$/i, 1]
  url = scholar_url(frontmatter)

  count = nil
  matched_url = url
  if title
    normalized = normalize_title(title)
    match = profile_rows[normalized]
    unless match
      match = profile_rows.find { |scholar_title, _row| scholar_title.include?(normalized) || normalized.include?(scholar_title) }&.last
    end
    if match
      count = match[:count]
      matched_url = match[:url] || matched_url
    end
  end

  count ||= citation_count(url) if url
  if count.nil? || count.empty?
    warn "No citation count: #{path}"
    next
  end

  frontmatter = upsert_frontmatter_value(frontmatter, "citations", count)
  frontmatter = upsert_frontmatter_value(frontmatter, "citation_source", "\"Google Scholar\"")
  matched_url = clean_url(matched_url)
  frontmatter = upsert_frontmatter_value(frontmatter, "citation_url", yaml_quote(matched_url)) if matched_url

  File.write(path, "#{frontmatter}#{body}")
  puts "#{count.rjust(4)}  #{path.sub(ROOT + "/", "")}"
  sleep 1 if url && !profile_rows.key?(normalize_title(title))
end
