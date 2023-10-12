<template>
    <div class="d-flex justify-content-center align-items-center">
        <div class="card question">
            <div class="card-body">
                <h1 class="card-title text-center">Question</h1>
                <h3>{{ question }}</h3>
            </div>
        </div>
    </div>

    <div class="button-container justify-content-center">
        <button class="answer-button answerA"> {{ answerA }}</button>
        <button class="answer-button answerB">{{ answerB }}</button>
    </div>
    <div class="button-container justify-content-center">
        <button class="answer-button answerC">{{ answerC }}</button>
        <button class="answer-button answerD">{{ answerD }}</button>
    </div>
</template>

<script>
export default {
    name: "QuestionComponent",
    props: {
        question: {
            type: String,
            default: "this Question is not available yet",
            required: true,
        },
        answerA: {
            type: String,
            default: "this Answer is not available yet",
            required: true,
        },
        answerB: {
            type: String,
            default: "this Answer is not available yet",
            required: true,
        },
        answerC: {
            type: String,
            default: "this Answer is not available yet",
            required: true,
        },
        answerD: {
            type: String,
            default: "this Answer is not available yet",
            required: true,
        },
    }
};

</script>