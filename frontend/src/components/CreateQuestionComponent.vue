<template>
    <div class="question-container">
        <div class="question">
            <h1>Question</h1><br>
            <input type="text" id="question" name="question" placeholder="Question"><br>
            <p> Mark the correct aswers</p>
        </div>
    </div><br>

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
