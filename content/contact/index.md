---
date: "2023-11-20"
sections:
- block: markdown
  content:
    title: Contact
    subtitle: ''
    text: |-
      <section class="contact-hub">
        <div class="contact-hub__hero">
          <div>
            <p class="contact-hub__eyebrow">Shen Lab @ NTU</p>
            <h2>Start a Conversation</h2>
            <p>For collaboration, prospective students, postdoctoral opportunities, software questions, visits, and media requests.</p>
            <div class="contact-hub__actions">
              <a class="contact-hub__button contact-hub__button--primary" href="mailto:xiaotao.shen@outlook.com">
                <i class="fa-solid fa-envelope"></i> Email Us
              </a>
              <button class="contact-hub__button contact-copy-button" type="button" data-copy="xiaotao.shen@outlook.com">
                <i class="fa-regular fa-copy"></i> Copy Email
              </button>
            </div>
          </div>
          <div class="contact-hub__signal" aria-hidden="true">
            <span></span><span></span><span></span><span></span>
          </div>
        </div>

        <div class="contact-purpose-grid">
          <article class="contact-purpose-card">
            <i class="fa-solid fa-handshake-angle"></i>
            <h3>Collaboration</h3>
            <p>Multi-omics, microbiome, metabolomics, wearable data, AI methods, and precision health projects.</p>
            <a href="mailto:xiaotao.shen@outlook.com?subject=Collaboration%20with%20Shen%20Lab">Discuss a project</a>
          </article>
          <article class="contact-purpose-card">
            <i class="fa-solid fa-user-graduate"></i>
            <h3>Prospective Students</h3>
            <p>PhD, master, undergraduate, and visiting student inquiries related to computational multi-omics.</p>
            <a href="mailto:xiaotao.shen@outlook.com?subject=Prospective%20student%20inquiry">Send inquiry</a>
          </article>
          <article class="contact-purpose-card">
            <i class="fa-solid fa-flask-vial"></i>
            <h3>Postdocs & Fellows</h3>
            <p>Independent researchers interested in omics methods, translational datasets, and precision health.</p>
            <a href="mailto:xiaotao.shen@outlook.com?subject=Postdoc%20or%20fellowship%20inquiry">Contact PI</a>
          </article>
          <article class="contact-purpose-card">
            <i class="fa-solid fa-code"></i>
            <h3>Software & Data</h3>
            <p>Questions about Shen Lab software, reproducible resources, code, package issues, or datasets.</p>
            <a href="/software/">View software</a>
          </article>
        </div>

        <div class="contact-main-grid">
          <section class="contact-location-card">
            <div class="contact-section-heading">
              <p>Location</p>
              <h3>Find Us at NTU</h3>
            </div>
            <div class="contact-address">
              <i class="fa-solid fa-location-dot"></i>
              <div>
                <strong>Shen Lab, Nanyang Technological University</strong>
                <span>59 Nanyang Dr, Singapore 636921</span>
              </div>
            </div>
            <div class="contact-map">
              <iframe title="Shen Lab location map" loading="lazy" referrerpolicy="no-referrer-when-downgrade" src="https://www.google.com/maps?q=59%20Nanyang%20Dr%2C%20Singapore%20636921&amp;output=embed"></iframe>
            </div>
            <div class="contact-hub__actions">
              <a class="contact-hub__button contact-hub__button--primary" href="https://maps.app.goo.gl/pcizQc8QdorHMMvB6" target="_blank" rel="noopener">
                <i class="fa-solid fa-map-location-dot"></i> Open Map
              </a>
              <button class="contact-hub__button contact-copy-button" type="button" data-copy="59 Nanyang Dr, Singapore 636921">
                <i class="fa-regular fa-copy"></i> Copy Address
              </button>
            </div>
          </section><div class="contact-side-stack">
            <section class="contact-join-card">
              <p>Join Us</p>
              <h3>Build computational multi-omics for precision health.</h3>
              <span>We welcome motivated students, fellows, visitors, and collaborators who enjoy open science and reproducible tools.</span>
              <div class="contact-hub__actions">
                <a class="contact-hub__button contact-hub__button--primary" href="/news/2023-11-23-recruitment/">
                  <i class="fa-solid fa-briefcase"></i> Open Positions
                </a>
                <a class="contact-hub__button" href="mailto:xiaotao.shen@outlook.com?subject=Joining%20Shen%20Lab">
                  <i class="fa-solid fa-paper-plane"></i> Send CV
                </a>
              </div>
            </section><section class="contact-social-card">
              <p>Profiles</p>
              <div class="contact-social-links">
                <a href="https://github.com/jaspershen-lab" target="_blank" rel="noopener" aria-label="GitHub">
                  <i class="fa-brands fa-github"></i><span>GitHub</span>
                </a>
                <a href="https://twitter.com/xiaotaoshen1990" target="_blank" rel="noopener" aria-label="X">
                  <i class="fa-brands fa-twitter"></i><span>X</span>
                </a>
                <a href="https://scholar.google.com/citations?user=3TK9yz8AAAAJ&hl=en" target="_blank" rel="noopener" aria-label="Google Scholar">
                  <i class="ai ai-google-scholar"></i><span>Scholar</span>
                </a>
                <a href="https://jaspershen.github.io/image/wechat_QR.jpg" target="_blank" rel="noopener" aria-label="WeChat">
                  <i class="fa-brands fa-weixin"></i><span>WeChat</span>
                </a>
              </div>
            </section>
          </div>
        </div>
      </section>

      <script>
      (function () {
        document.querySelectorAll('.contact-copy-button').forEach(function (button) {
          if (button.dataset.ready === '1') return;
          button.dataset.ready = '1';
          button.addEventListener('click', function () {
            var value = button.getAttribute('data-copy') || '';
            var original = button.innerHTML;
            function done() {
              button.innerHTML = '<i class="fa-solid fa-check"></i> Copied';
              window.setTimeout(function () { button.innerHTML = original; }, 1500);
            }
            if (navigator.clipboard && navigator.clipboard.writeText) {
              navigator.clipboard.writeText(value).then(done);
            } else {
              var input = document.createElement('textarea');
              input.value = value;
              document.body.appendChild(input);
              input.select();
              document.execCommand('copy');
              input.remove();
              done();
            }
          });
        });
      })();
      </script>
  design:
    columns: "1"
title: Contact
type: landing
---
