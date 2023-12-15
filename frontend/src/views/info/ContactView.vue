<template>
  <div class="faq-container">
    <div class="faq-card">
        <h1 class="contact-title">Contact</h1>
        <form id="contact-form" class="contact-form" action="#" method="POST">
            <div class="row g-3">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="email" class="form-label">E-Mail</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                </div>
            </div>
            <div class="form-group my-3">
                <label for="message" class="form-label">Message</label>
                <textarea class="form-control" id="message" name="message" rows="10" required></textarea>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary card-button">Send</button>
            </div>
        </form>
     </div>
    </div>
</template>