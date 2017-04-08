var Balance = Balance || {};
_.extend(Balance, {
  initialize: function() {
    this.initSelect2();
    this.bindEvents();
  },
  initSelect2: function() {

    $.ajax({
      url: '/users/get_friends',
      method: 'GET',
      type: 'json',
      success: function(response) {
        $("#payer").select2({
          placeholder: "Select members",
          data: response
        });
        $("#payee").select2({
          placeholder: "Select members",
          data: response
        });
      }
    })

  }
})
