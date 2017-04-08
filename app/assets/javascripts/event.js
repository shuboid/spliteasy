var Events = Events || {};
_.extend(Events, {
  initialize: function() {
    this.initSelect2();
    this.bindEvents();
    this.paymentCounter = 0;
  },
  initSelect2: function() {

    $.ajax({
      url: '/users/get_friends',
      method: 'GET',
      type: 'json',
      success: function(response) {
        $("#event-member").select2({
          placeholder: "Select members",
          data: response
        })
      }
    })

  },

  bindEvents: function(event) {
    $('.add-payment').on('click', this.addPayment.bind(this));
    $('#create-event').on('click', this.addEvent.bind(this));
  },

  addEvent: function(event) {
    $.ajax({
        url: 'events',
        type: "POST",
        dataType :'JSON',
        data: $('form').serializeArray(),
        success: function(){

        }
      })
  },

  addPayment: function() {
    var memberData = $("#event-member").select2('data');
    if (memberData.length > 0) {
      this.paymentCounter += 1
      var paymentDom = '<select name="event[payment]['+ this.paymentCounter +'][user]" class="form-control col-sm-1"> </select> \
                        <input name="event[payment][' + this.paymentCounter + '][amount]" class="form-control" type="">';
      var paymentData = [];
      _.each(memberData, function(member) {
        paymentData.push({id: member.id, text: member.text})
      });
      $('#payments').append(paymentDom);
      $('[name= "event[payment]['+ this.paymentCounter +'][user]"]').select2({data: paymentData});
    } else {

    }
  }

})
