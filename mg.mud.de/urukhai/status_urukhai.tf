; $Log: status_abenteurer.tf,v $
; Revision 1.1  2002/09/12 08:54:36  thufhnik
; Scratch
;

/set status_urukhai_tf_version $Id$
/set status_urukhai_tf_author=rhoakka@mg.mud.de
/set status_urukhai_tf_requires=util.hooks.tf config.tf(1.16)
/set status_urukhai_desc=Statuszeile und Report fuer die Uruk-Hai

;;; Konfiguration

/set_var CFG_ECHO_GAG_LEVEL 2

;;; Texte und Farben fuer die Spells

; Nachtsicht
/set_var CFG_MG_URUKHAI_NACHTSICHT_ECHO_TEXT Nachtsicht
/set_var CFG_MG_URUKHAI_NACHTSICHT_ECHO_ATTR Cgreen
/set_var CFG_MG_URUKHAI_NACHTSICHT_ALR_ECHO_TEXT Nachtsicht bereits aktiv
/set_var CFG_MG_URUKHAI_NACHTSICHT_ALR_ECHO_ATTR Cyellow
/set_var CFG_MG_URUKHAI_NACHTSICHT_OUT_ECHO_TEXT Nachtsicht aus
/set_var CFG_MG_URUKHAI_NACHTSICHT_OUT_ECHO_ATTR Cyellow
/set_var CFG_MG_URUKHAI_NACHTSICHT_ERROR_ECHO_TEXT Fehlschlag: Nachtsicht
/set_var CFG_MG_URUKHAI_NACHTSICHT_ERROR_ECHO_ATTR Cred
/set_var CFG_STATUS_TEXT_URUKHAI_NACHTSICHT_1 N
/set_var CFG_STATUS_COLOR_URUKHAI_NACHTSICHT_1 Cgreen

; Ruelpse
/set_var CFG_MG_URUKHAI_RUELPSE_ALK_ECHO_TEXT Ruelpse: Mehr Alkohol!
/set_var CFG_MG_URUKHAI_RUELPSE_ALK_ECHO_ATTR Cred

;;; Variablen intialisieren

/init_var urukhai_nachtsicht

;;; Statusmodule

/set sl_urukhai_nachtsicht_doc=Nachtsicht $[status_doc_attr("URUKHAI_NACHTSICHT_1")]
/def sl_urukhai_nachtsicht = \
	/set_status_var_flag urukhai_nachtsicht urukhai_nachtsicht 1


; Nachtsicht

/def -p0 -q -w -agCblue -mglob -t'Deine Augen bekommen einen gruenen \
		Schimmer.' \
		    urukhai_nachtsicht = \
				/set urukhai_nachtsicht 1%;\
				/cfg_echo MG_URUKHAI_NACHTSICHT %*

/def -p0 -q -w -agCblue -mglob -t'Du hast doch schon die Nachtsicht \
		aktiviert!' \
	    	dunkelelfen_nachtsicht_alr = \
				/set urukhai_nachtsicht 1%;\
			    /cfg_echo MG_URUKHAI_NACHTSICHT_ALR %*

/def -p0 -q -w -agCblue -mglob -t'Das gruene Schimmern in Deinen Augen \
		laesst nach und verschwindet.' \
		    urukhai_nachtsicht_aus = \
				/set urukhai_nachtsicht 0%;\
				/cfg_echo MG_URUKHAI_NACHTSICHT_OUT %*

/def -p0 -q -w -agCblue -mglob -t'Deine Augen brennen nur ein bisschen, \
		sonst passiert nichts.' \
		    urukhai_nachtsicht_error = \
				/set urukhai_nachtsicht 0%;\
				/cfg_echo MG_URUKHAI_NACHTSICHT_ERROR %*

; Ruelpse (nur fehlender Alkhohol, rest reduce.tf)

/def -p0 -q -w -agCblue -mglob -t'Du brauchst schon ein bisschen Alkohol, \
	damit Dein Ruelpser wirkt.' \
		urukhai_ruelpse_err = \
			/cfg_echo MG_URUKHAI_RUELPSE_ALK %*

/config_status
