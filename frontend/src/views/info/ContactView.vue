<template>
    <div class="container d-flex justify-content-center align-items-center">
        <div class="card loginForm login-card">
            <div class="card-body">
                <h1 class="card-title text-center">Contact us!</h1>
                <form id="contact-form" class="contact-form" action="#" method="POST">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="email">E-Mail</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="message">Mesasage</label>
                        <textarea class="form-control" id="message" name="message" rows="10" required></textarea>
                    </div>
                    <div class="button-container justify-content-evenly">
                        <button type="submit" class="btn btn-primary card-button">Send</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</template>