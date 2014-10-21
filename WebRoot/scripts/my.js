$().ready(function() {
 $("#RegisterForm").validate({
        rules: {
   name: "required",
   email: {
    required: true,
    email: true
   },
   password: {
    required: true,
    minlength: 5
   },
   confirm_password: {
    required: true,
    minlength: 5,
    equalTo: "#password"
   }
  },
        messages: {
   name: "Please Input UserName",
   email: {
    required: "Please Input Email Address",
    email: "Please input correct email format"
   },
   password: {
    required: "Please input password",
    minlength: jQuery.format("password can not be less than {0}")
   },
   confirm_password: {
    required: "Please confirm password again",
    minlength: "Password can not be less than {0}",
    equalTo: "the password you inputed is different from the first one"
   }
  }
    });
});