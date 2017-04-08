var User = User || {};
_.extend(User, {
  initialize: function() {
    this.initSelect2();
    this.bindEvents();
  },
  initSelect2: function() {
    $.ajax({
      url: '/users',
      method: 'GET',
      type: 'json',
      success: function(response) {
        var friendData = [];
        $('#friend-list').select2({
          placeholder: 'Select user',
          data: response
        })
      }
    })
  },
  bindEvents: function() {
    $('#add-friend').on('click', this.addFriend.bind(this));
  },
  addFriend: function() {
    var friendList = $('#friend-list').select2('data')[0];

    $.ajax({
      url: '/users/add_friend',
      data: {friend_list: friendList.id},
      method: 'PUT',
      type: 'json',
      success: function(response) {
        // do something
      }
    })
  }
})
