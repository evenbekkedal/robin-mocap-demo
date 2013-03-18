{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 0,
			"revision" : 8
		}
,
		"rect" : [ 0.0, 44.0, 1440.0, 806.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 9.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "bpatcher",
					"name" : "mocapPlayback.maxpat",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 635.5, 37.0, 168.0, 110.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "bpatcher",
					"name" : "iPodMocapRecorder.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 663.0, 548.0, 210.0, 187.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "bpatcher",
					"name" : "sequencerSynth.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 135.0, 346.0, 162.0, 74.0 ],
					"varname" : "nintendo-synth"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "bpatcher",
					"name" : "legomann.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 36.0, 535.0, 504.0, 461.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "bpatcher",
					"name" : "device3DVisualization.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1190.5, 272.0, 485.0, 398.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "bpatcher",
					"name" : "dataVisualizer.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 650.0, 234.0, 427.5, 227.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "bpatcher",
					"name" : "deviceInput.maxpat",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 36.0, 22.0, 153.0, 111.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "deviceInput.maxpat",
				"bootpath" : "/Users/evenbekkedal/Dropbox/Kode/Max/Even-max-patches/Robin Demonstrasjonmateriale 2013/iPodDemoPatch",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "dataVisualizer.maxpat",
				"bootpath" : "/Users/evenbekkedal/Dropbox/Kode/Max/Even-max-patches/Robin Demonstrasjonmateriale 2013/iPodDemoPatch",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "device3DVisualization.maxpat",
				"bootpath" : "/Users/evenbekkedal/Dropbox/Kode/Max/Even-max-patches/Robin Demonstrasjonmateriale 2013/iPodDemoPatch",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "legomann.maxpat",
				"bootpath" : "/Users/evenbekkedal/Dropbox/Kode/Max/Even-max-patches/Robin Demonstrasjonmateriale 2013/iPodDemoPatch",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "sequencerSynth.maxpat",
				"bootpath" : "/Users/evenbekkedal/Dropbox/Kode/Max/Even-max-patches/Robin Demonstrasjonmateriale 2013/iPodDemoPatch",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "fireball.png",
				"bootpath" : "/Users/evenbekkedal/Dropbox/Kode/Max/Even-max-patches/Robin Demonstrasjonmateriale 2013/iPodDemoPatch",
				"patcherrelativepath" : "",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "technoui.js",
				"bootpath" : "/Applications/Max6/Cycling '74/jsui-library",
				"patcherrelativepath" : "../../../../../../../../Applications/Max6/Cycling '74/jsui-library",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "eM_genverb.maxpat",
				"bootpath" : "/Users/evenbekkedal/Dropbox/Kode/Max/Even-max-patches/Robin Demonstrasjonmateriale 2013/iPodDemoPatch",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "iPodMocapRecorder.maxpat",
				"bootpath" : "/Users/evenbekkedal/Dropbox/Kode/Max/Even-max-patches/Robin Demonstrasjonmateriale 2013/iPodDemoPatch",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mocapPlayback.maxpat",
				"bootpath" : "/Users/evenbekkedal/Dropbox/Kode/Max/Even-max-patches/Robin Demonstrasjonmateriale 2013/iPodDemoPatch",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "osc-route.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "jcom.in~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "jcom.out~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "vbap.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "define_loudspeakers.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "jcom.oscroute.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
