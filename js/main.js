document.addEventListener('DOMContentLoaded', function () {
  // Contact form (Formspree)
  const form = document.getElementById('contact-form');
  if (form) {
    form.addEventListener('submit', function (e) {
      e.preventDefault();
      const btn = form.querySelector('button[type="submit"]');
      const orig = btn.textContent;
      btn.textContent = 'Sending...';
      btn.disabled = true;
      fetch(form.action, {
        method: 'POST',
        body: new FormData(form),
        headers: { Accept: 'application/json' }
      })
        .then(r => { btn.textContent = r.ok ? 'Sent ✓' : 'Error — try email directly'; })
        .catch(() => { btn.textContent = 'Error — try email directly'; btn.disabled = false; });
    });
  }
});
