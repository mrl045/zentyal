// Copyright (C) 2004-2007 Warp Networks S.L.
// Copyright (C) 2008-2013 Zentyal S.L. licensed under the GPLv2
"use strict";

Zentyal.namespace('Help');

Zentyal.Help.showHelp = function () {
    $('.help').slideToggle('fast');
};

Zentyal.Help.initHelp = function () {
    var helpElements = $('.help');
    var hasHelp = helpElements.length > 0;
    helpElements.hide();
    $('#helpbutton').toggle(hasHelp);
};

$(function(){
    Zentyal.Help.initHelp();
});
$('body').bind('DOMNodeInserted', Zentyal.Help.initHelp, false);

