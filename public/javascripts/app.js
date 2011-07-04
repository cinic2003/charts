

$(function() {
  // 导航菜单的切换显示
  var menu = $('.navigation > li');

  // 将每个导航菜单绑定一个action
  $(menu).each(function() {
    $(this).bind('click', function(){
      // 先将高亮的菜单去掉 再将点中的菜单高亮
      $($('.navigation > li.active')).removeClass('active');
      this.className = 'active';
      // 先隐藏已显示列表 在显示对应列表
      var id = this.id;
      $('.section > ul:visible').hide();
      $('#list_' + id).show();
    });
  });  
})
