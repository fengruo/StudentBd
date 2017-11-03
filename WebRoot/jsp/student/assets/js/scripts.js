
jQuery(document).ready(function() {

    /*
        Background slideshow
    */
    $.backstretch([
      "assets/img/backgrounds/1.jpg"
    , "assets/img/backgrounds/2.jpg"
    , "assets/img/backgrounds/3.jpg"
    ], {duration: 3000, fade: 750});

    /*
        Tooltips
    */

    $('.links a.weixin').tooltip();

    /*
        Form validation
    */
    $('.register form').submit(function(){


        ////
        var username = $(this).find('input#username').val();
        var kaohao = $(this).find('input#kaohao').val();

        if(username == '') {
          alert('学生姓名不能为空')
            return false;
        }
        if(kaohao == '') {
           alert('准考证号不能为空')
            return false;
        }

    });


});


