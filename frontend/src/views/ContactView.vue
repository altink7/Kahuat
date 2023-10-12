<template>
    <div class="home">
    <h1>Contact us! </h1>
  </div>
    <div class="container d-flex justify-content-center">
        <div class="card detail-product-card mx-auto text-center">
            <div class="row">
                <div class=" product-card-body">
                    <p>
                        If you have any queation regarding QuizApp don't hesitate to contact us!
                    </p>
                    <form id="contact-form" class="contact-form" action="#" method="POST">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" name="name" required>
                                </div>
                            </div>
                            <div class="col-md-6">
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
                        <div class="card-footer">
                            <button class="btn btn-primary card-button">send</button>
                        </div>
                    </form>
            </div>
        </div>
    </div>
    </div>
</template>