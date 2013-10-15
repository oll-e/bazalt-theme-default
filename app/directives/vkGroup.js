define('directives/vkGroup', [
    'app',

    '//vk.com/js/api/openapi.js?101'
], function(app) {
    'use strict';

    app.directive('vkGroup', ['$parse', function($parse) {
        var id = 1;
        return {
            restrict: 'A',
            scope: {
                'groupId' : '=vkGroup',
                'settings' : '@settings'
            },
            link: function(scope, element, attrs) {
                var currentId = 'vk-group-' + id++;
                element.attr('id', currentId);

                scope.settings = $parse(scope.settings)(scope) || {};

                VK.Widgets.Group(currentId, scope.settings, scope.groupId);
            }
        };
    }]);
});