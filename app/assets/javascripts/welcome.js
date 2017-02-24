$(document).ready(function() {
    $("#errorAlert").hide();
    navigator.geolocation.getCurrentPosition(setGeoLoc,function(err){console.log(err)});

    function setGeoLoc(location) {
      console.log(location);
      var coordinates = location.coords;
      var destination_list = {
        ceremony: {location: "The+Journey+Church+Moncton+Brentwood+Campus"},
        reception: {location: "The+Journey+Church+Moncton+Alison"}
      }
      //set map url
      var geo_loc = coordinates.latitude + "," + coordinates.longitude;

      $.each(destination_list, function(index,destination) {
        destination.url = "https://www.google.com/maps/embed/v1/directions?"+
        "&destination="+destination.location+
        "&origin="+ geo_loc +
        "&key=AIzaSyBH3bW2DynG16SHAvOO3eugF3Bu9i28Z20"+
        "&mode=driving";
      })
      console.log(destination_list);
      $("#receptionFrame").attr('src', destination_list.reception.url);
      $("#ceremonyFrame").attr('src', destination_list.ceremony.url)
    }
})

$(document).on('click', "#rsvpButton", function(e) {
    var rsvp_data = {
        access_code: $("#invitationCode").val(),
        attending: $("#attending").val(),
        comments: $("#comments").val()
    };

    var validation = checkInput();
    console.log(validation);
    if (validation.success) {
        $.ajax({
            method: 'POST',
            url: '/rsvp',
            data: rsvp_data,
            success: function(response) {
                if (response.code != "200") {
                    $("#errorAlert").show();
                    $("#errorMessage").html(response.result);
                } else {
                    //Clear out the form
                     $("#invitationCode").val("");
                     $("#attending").val("");
                     $("#comments").val("");

                     //Clear the error message
                     $("#errorMessage").val("");
                     $("#errorAlert").hide();
                }
            },
            error: function(error) {
                console.log(error);
            }
        });
    } else {
        $("#errorMessage").html(validation.message);
        $("#errorAlert").show();
    }

    function checkInput() {
        var code = $("#invitationCode").val();
        var attending = $("#attending").val();

        var error_message = undefined;
        if (code == "") {
            error_message = "Please enter the access code";
        }
        if (attending == "") {
            if (error_message !== undefined) {
                error_message += "<br>and<br>Please enter the names of those attending"
            } else {
                error_message = "Please enter the names of those attending";
            }
        }

        var success = false;

        if (error_message == undefined) {
            success = true;
        }

        return {
            success: success,
            message: error_message
        }
    }
});

$(document).on('click', "#ceremonyMapButton", function(e) {
    $("#receptionMap").addClass("hidden");
    if ($("#ceremonyMap").hasClass("hidden") == true) {
        $("#ceremonyMap").removeClass("hidden");
    } else {
        $("#ceremonyMap").addClass("hidden");
    }
});

$(document).on('click', "#receptionMapButton", function(e) {
    $("#ceremonyMap").addClass("hidden");
    if ($("#receptionMap").hasClass("hidden") == true) {
        $("#receptionMap").removeClass("hidden");
    } else {
        $("#receptionMap").addClass("hidden");
    }
});

$(document).on('click', ".map-container", function(e) {
    $(".map-frame").addClass('clicked');
}).mouseleave(function(){
    $(".map-frame").removeClass('clicked');
});