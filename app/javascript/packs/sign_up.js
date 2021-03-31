
    document.getElementById('name').value = 'John Doe'
    document.getElementById('email').value = 'john.doe@mail.com'
    document.getElementById('email').focus()
    const allInputs = document.querySelectorAll('input');
    for (const input of allInputs) {
        input.addEventListener('input', () => {
            const val = input.value
            if (!val) {
                input.parentElement.classList.add('empty')
            } else {
                input.parentElement.classList.remove('empty')
            }
        })
    }