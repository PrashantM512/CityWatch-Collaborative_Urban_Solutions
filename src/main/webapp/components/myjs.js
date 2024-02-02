function formatAadhar(input) {

    var value = input.value.replace(/\s+/g, '').replace(/\D/g, '');
    value = value.replace(/(.{4})/g, '$1 ');
    input.value = value.trim();
}