{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 0,
			"revision" : 5
		}
,
		"rect" : [ 14.0, 58.0, 1259.0, 531.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
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
					"fontname" : "Rockwell",
					"fontsize" : 12.0,
					"frgb" : [ 0.413265, 0.413265, 0.413265, 1.0 ],
					"id" : "obj-21",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 932.0, 161.0, 302.0, 63.0 ],
					"text" : "Developed by Kristian Nymoen\nkrisny (a) ifi.uio.no\nrequirements:\n- OSC-route (cnmat.berkeley.edu/downloads)",
					"textcolor" : [ 0.413265, 0.413265, 0.413265, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Rockwell",
					"fontsize" : 12.0,
					"id" : "obj-17",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 932.0, 84.0, 302.0, 21.0 ],
					"text" : "fourMs Feature Extractor - 1 object, 3 Dimensions"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1125.0, 361.0, 61.0, 20.0 ],
					"text" : "r #0_mult",
					"varname" : "u621000800[11]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 1111.0, 384.0, 32.5, 20.0 ],
					"text" : "* 1.",
					"varname" : "u621000800[12]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-73",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 722.0, 93.0, 41.0, 34.0 ],
					"text" : "pvar filter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-71",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 212.0, 414.0, 60.0, 20.0 ],
					"text" : "pvar filter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 440.0, 230.0, 60.0, 20.0 ],
					"text" : "pvar filter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 298.0, 230.0, 60.0, 20.0 ],
					"text" : "pvar filter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 172.0, 230.0, 60.0, 20.0 ],
					"text" : "pvar filter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 75.0, 115.0, 34.0, 20.0 ],
					"text" : "+ 10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 33.0, 115.0, 32.5, 20.0 ],
					"text" : "+ 7"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.0, 85.0, 60.0, 20.0 ],
					"text" : "pvar filter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-117",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 752.0, 99.0, 50.0, 20.0 ],
					"varname" : "filter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-115",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 752.0, 69.0, 64.0, 20.0 ],
					"text" : "route filter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-98",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 850.5, 402.0, 69.0, 20.0 ],
					"text" : "* 57.29578"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-97",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 822.5, 361.0, 107.0, 34.0 ],
					"text" : "prepend /aed_elevation/rad"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-92",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.5, 436.0, 111.0, 34.0 ],
					"text" : "prepend /aed_elevation/deg"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-88",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 755.0, 300.0, 87.0, 20.0 ],
					"text" : "cartopol"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 699.5, 408.0, 69.0, 20.0 ],
					"text" : "* 57.29578"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-80",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 699.5, 445.0, 111.0, 34.0 ],
					"text" : "prepend /aed_azimuth/deg"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-79",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 681.0, 368.0, 106.0, 34.0 ],
					"text" : "prepend /aed_azimuth/rad"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 681.0, 265.0, 53.0, 20.0 ],
					"text" : "cartopol"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 985.0, 322.0, 61.0, 20.0 ],
					"text" : "r #0_mult",
					"varname" : "u621000800[8]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 971.0, 345.0, 32.5, 20.0 ],
					"text" : "* 1.",
					"varname" : "u621000800[13]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 413.0, 207.0, 61.0, 20.0 ],
					"text" : "r #0_mult",
					"varname" : "u621000800[6]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 399.0, 230.0, 32.5, 20.0 ],
					"text" : "* 1.",
					"varname" : "u621000800[7]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 279.0, 207.0, 61.0, 20.0 ],
					"text" : "r #0_mult",
					"varname" : "u621000800[4]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 265.0, 230.0, 32.5, 20.0 ],
					"text" : "* 1.",
					"varname" : "u621000800[5]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 669.0, 61.0, 63.0, 20.0 ],
					"text" : "s #0_mult",
					"varname" : "u621000800[3]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 145.0, 207.0, 61.0, 20.0 ],
					"text" : "r #0_mult",
					"varname" : "u621000800[2]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 131.0, 230.0, 32.5, 20.0 ],
					"text" : "* 1.",
					"varname" : "u621000800[1]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 669.0, 36.0, 132.0, 20.0 ],
					"text" : "patcherargs 1 @filter 3",
					"varname" : "u621000800"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 131.0, 115.0, 94.0, 20.0 ],
					"text" : "OSC-route /pos"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-19",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1111.0, 443.0, 123.0, 34.0 ],
					"text" : "prepend /horizontal_distance"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-9",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1111.0, 298.0, 132.0, 33.0 ],
					"text" : "expr \"sqrt(pow($f1,2) + pow($f2,2))\""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "float", "float", "float" ],
					"patching_rect" : [ 681.0, 230.0, 87.0, 20.0 ],
					"text" : "unpack 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 971.0, 458.0, 133.0, 20.0 ],
					"text" : "prepend /aed_distance"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-62",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 75.0, 175.0, 67.0, 75.0 ],
					"text" : "initial heavier filtering to prevent bursts"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 18.0, 259.0, 35.0, 20.0 ],
					"text" : "!- 13"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 18.0, 161.0, 34.0, 20.0 ],
					"text" : "< 10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 18.0, 186.0, 54.0, 20.0 ],
					"text" : "gate 1 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 18.0, 209.0, 24.0, 20.0 ],
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 18.0, 233.0, 73.0, 20.0 ],
					"text" : "counter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 131.0, 414.0, 75.0, 20.0 ],
					"text" : "clip 0. 2500."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 465.0, 265.0, 79.0, 20.0 ],
					"text" : "light filtering"
				}

			}
, 			{
				"box" : 				{
					"data" : [ 3623, "", "IBkSG0fBZn....PCIgDQRA...zL...PPHX....fbNChx....DLmPIQEBHf.B7g.YHB..M3cRDEDU3wY6c86Sar7DeRTJ3OATpP2q4Rp9ZNprDJfoJcoJJmEcogmPHgDmCkHJI3HEonnWZR2S9h9VktTgwHK4JLjJ70voTEweBzcuBybL25cuc16N+Kx8QxJA681clYmY1Ym8G2ihhhhfRThRvFOdZS.knDyanznoDkvPTZzThRXHJMZJQILDOIqOXXP.7qKuD9wEW.md5oRKy62aOXoJU.Ka6LSfknDyZ3Qll8r199vOt3BnYylrelSZ0Bp45ZLwUhRLKBiLZZznwHFKNNNP+9809rkFNk3gBXazrxJqLhwgiiCb94mK82DAV1RLc.FNcdQQ43qsuetqiolS3HFvwwIB.XjOmzpUTTTTzIsZI82oebbb3zTkXLAOOOs8Qb9344UHziJcJS9b8fAEBsXJzl8rFMZnbTDzRulqK333nqpJwTDub4kAGGmb2OoJoOlfvf.VgzqBEAejKjlEUZifHNxgtQaJJOTkH+3jVsxkm975gmSjIxz2NoUqo1nKTjpQSZBVYFApBAvwwYlfYKQRj0P1xqCvrztyR5OJMZtdvfLI3PuX3GOOuYJFtDIA0wH1ewwqeVgndEmQ7l0lOrxE27e95WU8SohZttv4koVdtAqu95IlewKWdYP2Jv0ueensuelxdEMCddddw027DTlHfhXBekX1Gub4kS72KUoBqIY+iKtHSs269vGT11yKPoQy7l0eIJFXYaCqu95ZKWylMgvf.ipawrlMutX2RMZLUXThGF.Un+629VVk2zEKkFxOFZ17HjZzTDqbbIl+.FVlksMqPzngZwAzsfEWCyYQ7j7LpRZOqI6r4vffXuPplK05quN7xkWtP10zhzsLmDbBcPF+KVWlDBhN5RFuKJ6vPq9629VikSzPmd+d6AaTut1xGFDvpcnaaFGGmI9NeG2nwlne0nQiXY5wGe78EtH1NChe3jhvqGLHxyyKSKxFlZTNPLE33yaJ8mk5ARY8EPdmVe59P4YT9kV4ws4jN4C8Yn0uozTZfxiT5ZblhaNxnzzuT09Y97zjGHa2RSgmmG7xkWNNCMhkse+9P+98gSO8T386sWpdy+wEWLRRMxZRNJp5AfgiJj0mOLH.d8lap842ndc3ZCFYlFRlksM344o8HfvIKqhI.XoJUXQO4As88g28gOHUF433LRxNn8Gn9kRP81YpmOUOqJOCWOXPp0spcNftmKMucn2FS73Hi9udvfnSZ0x3QGUMRSVpKbajvs7p3EQ5fV9z9sznqz.U1K1WMNFoIM5NsEaOsczBER2Q.bDVltUJxpACWZhifk6dthScw0HjytgfacIR6bcvoSljVe.m5WmtfpPy3x6lXzjlSENamKY5oSMiFcBeNweqS.yglJxiwPdlSSVpKJeh0adogzFoIJhuAMm5WlbsnMZz4XlCjsUenXhbwZj1wK.Am3b0sBxMa1T6gaZRDOcV.mETDfgy263iOFrrsy8VrWDxRyL2TCqRtSSKMWdLqnnjGV11vIsZot.57Nn5C2QZ3DCtIdRxacUjzSQNRSVj4EAunajFt7op4ApSVTjizvQFxIhFYzFk1G6izvYieZhGHcK5FtYB+S.bVDRSksxV6IN0AtlMTHtC.lEtUh1ndcnsuOqc8hpQYGqFMgAArRIYQuw8Lckpmmw62aOk+liiSxEkSC52uuTEatgnI5fj12OKs4L2ndc30atIznQiTcvhgocRqVIjKi8QZJ5M9IWud+ofZttv0CF.dddwi5333.dddFeQlnZTKtaqFpQRae+39AGGmIxlyzj4q1ueenYylvF0qCqrxJvJqrhzQfp45NBsOVWbyo4dXi6163g.rrsMZDEUHMmMltsZnGcfwcB.PfF2l5zDKOxe3hqqxPerNRC2ybw3HiVka5Tygp4z..+9n+4qeEBCBlZaNyzBWkKvQfZzngT4wb2c47rTrwOzfp4z.v8aqFc3zSOMwbalzaNyZttE1wNnYylve8rmMhgybmQSVOwfkPOzMuENNrv4JfnH77aJN93iKzq3IQCm4NilxQZFeP2bAxx8a2z5zYd94mm9BTZHnidN2YzLMmmzCcj1bZPXxj5m1mNSYYVLqfd7tGqFMbGUnbR6yFHs4zfvjI0OoOcls88GYcWvLKd94mmaCHTOcrZzLsFZdZbx.en.cizvcMalz8AgAAvF0qCaTutRdPz.5jVsxjAzXO7LNCQaxj64rCCRaxmkFS4Gblb+jNA.z90Wu4lrJeMW2349Xx0V0X2ngSHZlbGqw4U5QdmOyeR6n.QGVbBUli7cZd8LY59OrlqK7++2+Ua4Pc4wtQSQl2bNBh2u2dZGMgiWEcsUQus7mVPzgEmQ80Eh1zJA.TZ5ce3CFcUjwYcnPmESjrmoaBgb8LnqCk6dbhSFfRaSe112G9qm8Ls0wrNjoTw80BYZgeMKb8L0ueeVgowEIliltyQfpOldts0c1Ox64fwD5g6YeGOgj3Yo.OW+bdVSoqw8EOtLn5bxv8s7PdoQStuC3bNXjwOb4EUOO9gVGiXzXx6NDGCemgn6L5m1AaKO2u.lVexpeYchlbAjHZ.lUYtmmmQGjJJv1m6E5A1VlbQTn6vIZJMXB8jlS.cxLcWFGT.Hijk6eLSEXbZKpgHdCvjUCMczQV4SrCHKxLjdy6KVItJCHx6qOPYxYYJZoc66TD5XTd2zKADz4kI5WxjufJlOqLBWjWgXQ7duwTmEhcTlR+Tk7hRlmkKquhrukdoGlFsTTuyOoeRynIqWTfbzudTTTTTQ8l+E.yS0HdsphYwQUFobt6BdqntZZo.u9QS6hkS107JdUmhP1qsBD3EgAVGEkLmqrHuGA77JyKRcLDhzjpqQV5URaZ5W..J6qof8qD8IERa0bmFsc4hg9vBEg90LmQSIJwrNl61kyknDSaTZzThRXHlZFMSy21Z4ssCCBh+LqgYQZJufq7dR0m7D.FMyJhY.S2uaJZ66CUO7H3p0VEd9W9TtpmznKwL1Ty0M2scXP.b6G+LX0o6vuH3mZKOkFDy3ite2Dbq8+CdJ.P32+1XOAFbnaZ+Sdy91Se0aFVmGruT8uvff3xLt4+m.vPFBaP..nMbuBXXP.T8vih+sdGr+XiXLEoQ2.LTP+z69+Hcm2c.sksMDt61.fFMLAUFRMz90kWF+agqsJ.Lou199vhm0CVX2suOM1qs58FyiYXYamf1AHoxJ5bBoKt7kp15JC3swsCiGiMRuC1eHyA.r3Y8hKvut7x3uGfhYKeWy0EVH3m4ZTF.Fktocfs88kR2V11vu+92xcaaBMVy0MAsP8.Sk027hpr6vW7rdfUmtI71+7u7I32SfQYPHxWTZYwy5k32F2zjksMrPvOgEzLxeQf3KKvEOq2vNsNcAqNciWHN52i.CQAwy+xmfq1ZmD+M.26M7lWTM9eWpRkQdVY04MunJaCTJ8wktu5t1FoQqNcgdGreBkXpWbrbYAXb18NXen5gGMrdtKTQ3EUA..odQQYJJ+P5osuOT8txu3Y8f12Udj9ZSjcx5Cp45JUdixASM7D4qzlWA1tX6A.jvAlN8.jeqd3QP3ZqFKSn5eKr61..vH0i3ynq8DkcHslHQ.KUoRr2gec4kwLuXHMV11inPtvtaGavgDC54ulqKrvtaOrSQxyhwiZ0oar.r5gGwZUrQlAoap.PFcKRmhcHn.m5EG4Ej9vxXJP5whnvqJbwq1ZGvpSWXgc2Fp45BVc5BO8UuABCBRzOgNhvxPkqzPjP9Dkqz9A7Yt4NCXZHulxW3bcnxHrdw51pS26G4uS2394199ws8y+xm.qNcSFVKo8vPQw9aw9Uzn.+NYOCcdPh5cxzeQLR1yPFbwy5A29wOmYEDTgypSW3ps1IgfTT4IV4jnHDt1prl+ARuT57ps1gEcK5QDCOhJC.3dCw7NeNKa6XdD8LJyidae+Q57oNEDeFwxf.6zQYA9u32ix2v0VU5cVbV3qa+3micNhfNBcuC1eXH0DYO963+hx+v0VcDdB6iD6eoz.srX8PeFQ8N.TGxrL82XiladQU3WWdYBO.Hwjk8LDMdWziAp7IZjHF1SMW2gdZLHDApmEtzM25uHmb8MjvwndfkAQkf7BQ4g3emmz0ZBegNjEgnb94e4SJm6or9Vt8Sxz6VpREXgc2Nd9tTiPQ82XiFZEP83mUz12OlHPOzHSINBxMJhqGy69UasixNTYzMhh5tOSkwMEWs0NJCmjZbRoIUd1EGIlBw9DN7nJmGo0NHZ66mX9Bp.kWT0+JFlK98zQD.PnOMm2szxfX3nVc5BV11weBCBh0eWH3min+9Xjvr5zcXFOBBFILJJSfJFTAdae+DdNBCBR3MIN80j4KgOKFiNBT4C6nv0DQlmIUzsrIBhzMUARbwvDCS.KCcX8199iLrNRGUO7Hocx37Sv4RPC6.eVrcwDYf+Ns9kEx5se7yi7Jh.oeryVju982+lTYAEn7BUxk4P.CiD+Mjuh2Q2B7k3yRoKQ4LpGb6G+7H7FcMhPcHZYveSreTjeoyMjp2gkCmConysGEEEEIaQBi67jrktEyt..CUTEWrKYOWZKJlX8Qa+pGdzHoSzT5VFMI9cx9ar9PiPQu8X69zW8FnmvhuIieQfYBSjdnxCw1gVuT5QGcKlANYzkp9K74yCeg0GMiTzLoJRWzrUoiVw1VWY3pGqSuetXWNe0V6XTJnmF.UtlTq+yjBHeQSS6e5XleCaFFDLyav.vPubOzLX..hyZToAy8XtXjlRThYI7e.NsNZVKCiuQN.....IUjSD4pPfIH" ],
					"embed" : 1,
					"id" : "obj-5",
					"maxclass" : "fpic",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 935.0, 20.5, 205.0, 65.0 ],
					"pic" : "UIO:/Users/fourms_user/Desktop/Qualisys-demo/graphics/fourMs-BlackRed.gif"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Rockwell",
					"fontsize" : 12.0,
					"id" : "obj-11",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 16.0, 50.0, 302.0, 21.0 ],
					"text" : "fourMs Feature Extractor - 1 object, 3 Dimensions"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Rockwell",
					"fontsize" : 30.0,
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 16.0, 12.0, 233.0, 42.0 ],
					"text" : "fFE.3D1"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 0.698039, 1.0 ],
					"id" : "obj-3",
					"ignoreclick" : 1,
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 16.0, 10.0, 310.0, 62.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-4",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 328.0, 36.0, 308.0, 34.0 ],
					"text" : "Abstraction which extracts some basic features based on three-dmensional streamed data"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 322.0, 67.0, 20.0 ],
					"text" : "prepend /x"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 611.0, 458.0, 67.0, 20.0 ],
					"text" : "prepend /z"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 483.0, 458.0, 67.0, 20.0 ],
					"text" : "prepend /y"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-52",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 553.0, 443.0, 56.0, 34.0 ],
					"text" : "prepend /delta_z"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-51",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 55.0, 443.0, 62.0, 34.0 ],
					"text" : "prepend /delta_x"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-50",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 292.0, 445.0, 116.0, 34.0 ],
					"text" : "prepend /horizontal_velocity"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-49",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 423.0, 443.0, 57.0, 34.0 ],
					"text" : "prepend /delta_y"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 131.0, 458.0, 153.0, 20.0 ],
					"text" : "prepend /absolute_velocity"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 292.0, 415.0, 201.0, 20.0 ],
					"text" : "expr \"sqrt(pow($f1,2) + pow($f2,2))\""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-37",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 144.0, 138.0, 88.0, 20.0 ],
					"text" : "x = sideways"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-36",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 248.0, 138.0, 97.0, 20.0 ],
					"text" : "y = back/forth"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-35",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 365.0, 138.0, 99.0, 20.0 ],
					"text" : "z = up/down"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 131.0, 436.0, 62.0, 20.0 ],
					"text" : "slide 3. 3."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 131.0, 392.0, 35.0, 20.0 ],
					"text" : "* 25."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 399.0, 307.0, 32.5, 20.0 ],
					"text" : "t f f"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 399.0, 265.0, 60.0, 20.0 ],
					"text" : "slide 3. 3."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 399.0, 334.0, 79.0, 20.0 ],
					"text" : "expr $f2 - $f1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 265.0, 307.0, 32.5, 20.0 ],
					"text" : "t f f"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 265.0, 265.0, 60.0, 20.0 ],
					"text" : "slide 3. 3."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 265.0, 334.0, 79.0, 20.0 ],
					"text" : "expr $f2 - $f1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 131.0, 307.0, 32.5, 20.0 ],
					"text" : "t f f"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 131.0, 265.0, 60.0, 20.0 ],
					"text" : "slide 3. 3."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 131.0, 334.0, 79.0, 20.0 ],
					"text" : "expr $f2 - $f1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 131.0, 368.0, 287.0, 20.0 ],
					"text" : "expr \"sqrt(pow($f1,2) + pow($f2,2) + pow($f3,2))\""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "float", "float", "float" ],
					"patching_rect" : [ 131.0, 175.0, 287.0, 20.0 ],
					"text" : "unpack 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-42",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 131.0, 85.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-43",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 307.0, 498.0, 25.0, 25.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 620.5, 487.0, 316.5, 487.0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-117", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-115", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 27.5, 257.0, 12.5, 257.0, 12.5, 157.0, 27.5, 157.0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 140.5, 360.5, 64.5, 360.5 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1120.5, 487.5, 316.5, 487.5 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 49.5, 487.0, 316.5, 487.0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 140.5, 138.5, 62.5, 138.5 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 140.5, 139.0, 690.5, 139.0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 140.5, 140.0, 828.0, 140.0, 828.0, 259.0, 1120.5, 259.0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 980.5, 487.5, 316.5, 487.5 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 140.5, 303.0, 49.5, 303.0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 140.5, 330.5, 200.5, 330.5 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 274.5, 330.5, 334.5, 330.5 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 408.5, 330.5, 468.5, 330.5 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 408.5, 297.0, 620.5, 297.0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 408.5, 358.0, 483.5, 358.0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 408.5, 358.5, 562.5, 358.5 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 140.5, 487.0, 316.5, 487.0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 432.5, 487.0, 316.5, 487.0 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 301.5, 487.0, 316.5, 487.0 ],
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 64.5, 487.0, 316.5, 487.0 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 562.5, 487.0, 316.5, 487.0 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 492.5, 487.0, 316.5, 487.0 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 27.5, 295.0, 72.5, 295.0, 72.5, 259.0, 181.5, 259.0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 27.5, 295.0, 72.25, 295.0, 72.25, 259.0, 161.0, 259.0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 27.5, 295.0, 72.5, 295.0, 72.5, 259.0, 315.5, 259.0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 27.5, 295.0, 72.25, 295.0, 72.25, 259.0, 295.0, 259.0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 27.5, 295.0, 72.5, 295.0, 72.5, 259.0, 449.5, 259.0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 27.5, 295.0, 72.25, 295.0, 72.25, 259.0, 429.0, 259.0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 690.5, 487.5, 316.5, 487.5 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 709.0, 488.0, 316.5, 488.0 ],
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-88", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-88", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 860.0, 487.0, 316.5, 487.0 ],
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 832.0, 486.0, 316.5, 486.0 ],
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-98", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "OSC-route.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
