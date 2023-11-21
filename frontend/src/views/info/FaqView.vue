<template>
  <div class="faq-container">
    <div class="faq-card">
      <h1 class="faq-title">Frequently Asked Questions</h1>
      <div v-for="(item, index) in faqItems" :key="index" class="faq-item">
        <button class="accordion-button" @click="toggle(index)">
          {{ item.question }}
        </button>
        <div v-show="activeIndex === index" class="accordion-panel">
          <p>{{ item.answer }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeIndex: null,
      faqItems: [
        {
          question: "How can I create a quiz?",
          answer: "Visit Home and click on 'Create Quiz'."
        },
        {
          question: "How can I play a quiz?",
          answer: "Visit Home and click on 'Play'. Then you can choose the category or enter a PIN for a specific quiz."
        },
        {
          question: "How can I contact Kahuat's developer?",
          answer: "You can find our contact form in the footer."
        }
      ],
    };
  },
  methods: {
    toggle(index) {
      this.activeIndex = this.activeIndex === index ? null : index;
    }
  }
};
</script>