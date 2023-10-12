<template>
    <div class="d-flex justify-content-center align-items-center">
        <div class="card question">
            <div class="card-body">
                <h1 class="card-title text-center">Question</h1>
                <form id="question-form" class="question-form" action="#" method="POST">
                    <div class="row">
                        <div class="form-group">
                            <textarea class="form-control-question" id="question" name="question" required></textarea>
                        </div>
                        <div>
                            <p> Mark the correct aswers</p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="button-container justify-content-center">
        <div class="answer-option answerA">
            <input type="text" id="answerA" name="answerA" placeholder="Answer a)">
            <input type="checkbox" id="answerAIsTrue" name="answerAIsTrue" value="true">
        </div>
        <div class="answer-option answerB">
            <input type="text" id="answerB" name="answerB" placeholder="Answer b)">
            <input type="checkbox" id="answerBIsTrue" name="answerBIsTrue" value="true">
        </div>
    </div>
    <div class="button-container justify-content-center">
        <div class="answer-option answerC">
            <input type="text" id="answerC" name="answerC" placeholder="Answer c)">
            <input type="checkbox" id="answerCIsTrue" name="answerCIsTrue" value="true">
        </div>
        <div class="answer-option answerD">
            <input type="text" id="answerD" name="answerD" placeholder="Answer d)">
            <input type="checkbox" id="answerDIsTrue" name="answerDIsTrue" value="true">
        </div>
    </div>
</template>
