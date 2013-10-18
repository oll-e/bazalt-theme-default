define('app', [
    'angular', 'angular-animate', 'angular-route', 'angular-route-segment', 'angular-smoothscroll',
    'ngSocial',

    'modules/bzConfig/module',
    'modules/bzLanguage/module',
    'modules/bzWidgets/module',
    'modules/bzLoading/module',
    'modules/bzImg/module',
    'modules/bzGalleria/module',
    'modules/bzDatepicker/module',

    'components/bcPages/module',
    'components/bcMenu/module',
    'components/bcUsers/module'
], function (angular) {
    'use strict';

    var modules = ['ngAnimate', 'ngRoute', 'route-segment', 'view-segment', 'angularSmoothscroll', 'ngSocial'];

    // modules
    modules.push('bzConfig');
    modules.push('bzLanguage');
    modules.push('bzWidgets');
    modules.push('bzLoading');
    modules.push('bzImg');
    modules.push('bzGalleria');
    modules.push('bzDatepicker');

    // components
    modules.push('Components.bcUsers');
    modules.push('Components.bcMenu');
    modules.push('Components.bcPages');

    return angular.module('app', modules);
});