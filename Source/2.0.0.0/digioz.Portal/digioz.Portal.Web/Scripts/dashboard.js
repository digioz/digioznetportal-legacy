$(function () {
    CallHome();
    LatestUsers();
    LowestPointUsers();
    LowestPointPosts();
    HighestViewedTopics();
    LatestNews();
    TodaysTopics();
});

function LatestUsers() {
    $.post(app_base + "Admin/Panel/LatestUsers",
    function (data) {
        $(".dashboardlatestusers").html(data);
    });
}

function LowestPointUsers() {
    $.post(app_base + "Admin/Panel/LowestPointUsers",
    function (data) {
        $(".dashboardlowestpointusers").html(data);
    });
}

function LowestPointPosts() {
    $.post(app_base + "Admin/Panel/LowestPointPosts",
    function (data) {
        $(".dashboardlowestpointposts").html(data);
    });
}

function TodaysTopics() {
    $.post(app_base + "Admin/Panel/TodaysTopics",
    function (data) {
        $(".dashboardtodaystopics").html(data);
    });
}

function HighestViewedTopics() {
    $.post(app_base + "Admin/Panel/HighestViewedTopics",
    function (data) {
        $(".dashboardhighestviewedtopics").html(data);
    });
}

function LatestNews() {
    $.post(app_base + "Admin/Panel/MvcForumLatestNews",
    function (data) {
        $(".mvcforumlatestnews").html(data);
    });
}
function CallHome() {
    var url = document.domain;
    $.post("http://www.mvcforum.com/base/MVCBase/DomainCheck", { "url": url }, function (data) {
        //TODO: Add stuff here if needed
    });
}