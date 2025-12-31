document.addEventListener('DOMContentLoaded', () => {

    function updateProgress(formId, barId) {
        const form = document.getElementById(formId);
        const bar = document.getElementById(barId);
        
        if (form && bar) {
            const totalQuestions = form.querySelectorAll('.tes-card-new').length;
            const answeredQuestions = new Set();
            form.querySelectorAll('input[type="radio"]:checked').forEach(radio => {
                answeredQuestions.add(radio.name);
            });
            
            const progress = (answeredQuestions.size / totalQuestions) * 100;
            bar.style.width = progress + '%';
        }
    }

    const minatForm = document.getElementById('tesMinatForm');
    if (minatForm) {
        minatForm.addEventListener('change', () => updateProgress('tesMinatForm', 'progressBar'));
    }

    const bakatForm = document.getElementById('tesBakatForm');
    if (bakatForm) {
        bakatForm.addEventListener('change', () => updateProgress('tesBakatForm', 'progressBarBakat'));
    }

    const validateForm = (e, formId) => {
        const form = document.getElementById(formId);
        const totalQuestions = form.querySelectorAll('.tes-card-new').length;
        const answeredQuestions = new Set();
        
        form.querySelectorAll('input[type="radio"]:checked').forEach(radio => {
            answeredQuestions.add(radio.name);
        });

        if (answeredQuestions.size < totalQuestions) {
            e.preventDefault();
            alert('Mohon jawab semua pertanyaan sebelum submit!');
            return false;
        }
    };

    if (minatForm) minatForm.addEventListener('submit', (e) => validateForm(e, 'tesMinatForm'));
    if (bakatForm) bakatForm.addEventListener('submit', (e) => validateForm(e, 'tesBakatForm'));

    const progressCircle = document.querySelector('.progress-circle');
    if (progressCircle) {
        const progressValue = progressCircle.querySelector('.progress-value');
        if (progressValue) {
            const percentage = parseInt(progressValue.textContent);
            const degrees = (percentage / 100) * 360;
            progressCircle.style.background = `conic-gradient(#3b71ca ${degrees}deg, #e0e0e0 ${degrees}deg)`;
        }
    }

    const flashMessages = document.querySelectorAll('.flash-message');
    flashMessages.forEach(message => {
        setTimeout(() => {
            message.style.opacity = '0';
            message.style.transform = 'translateX(100%)';
            message.style.transition = 'all 0.5s ease';
            setTimeout(() => message.remove(), 500);
        }, 4000);
    });
    
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    document.querySelectorAll('.card, .tes-card-new, .work-item').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(20px)';
        el.style.transition = 'all 0.5s ease-out';
        observer.observe(el);
    });
});