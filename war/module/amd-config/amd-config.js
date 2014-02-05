var require = {
		baseUrl : 'module/',
		paths : {
			jquery : 'libraries/jquery/jquery-2.0.0.min',
			underscore : 'libraries/underscore/underscore.min',
			handlebars : 'libraries/handlebars/handlebarshelpers',
			handlebarshelpers :'libraries/handlebars/handlebars',
			css : 'libraries/require/css',
			normalize : 'libraries/require/normalize',
			async : 'libraries/require/async',
			text : 'libraries/require/text',
			bmin : 'libraries/bootstrapv3.0.3/js/bootstrap.min'
			/*bTrans : 'libraries/bootstrap/assets/js/bootstrap-transition',
			bDropdown : 'libraries/bootstrap/assets/js/bootstrap-dropdown',
			bCollapse : 'libraries/bootstrap/assets/js/bootstrap-collapse'*/
		},
		shim : {
			'backbone' : {
				deps : [ 'underscore', 'jquery' ],
				exports : 'Backbone'
			},
			'handlebars' : {
				deps : [ 'handlebarshelpers' ]
			},
			'persistence' : {
				exports : 'Lawnchair'
			},
			'animate' : {
				deps : [ 'jquery' ],
			},
			'uimenu' : {
				deps : [ 'uiwidget'],
			},
			'bootstrap' : {
				deps : ['jquery']
			},
			'bmin' : {
				deps : ['jquery']
			}
		},
		waitSeconds : 60,
		/* urlArgs: "v=0.25",  */
		deps : ['app/js/apploader']
};