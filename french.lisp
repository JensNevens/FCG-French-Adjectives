;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; POSITION OF FRENCH ADJECTIVES ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; 1. Load and set up FCG
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(asdf:operate 'asdf:load-op 'fcg-light)
(in-package :fcg-light)
(activate-monitor trace-fcg-light)

;;;; 2. Load the following FCG Light Example Grammar
;;;;    by executing def-fcg-light-constructions
;;;;    and def-fcg-light-cxn definitions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(def-fcg-constructions french-grammar
  :feature-types ((args sequence)
			(form set-of-predicates)
			(meaning set-of-predicates)
			(constituents sequence)
			(sem-class set)
			(resulting sequence))
  :hierarchy-features '(constituents)

;;;; Articles
;;;;;;;;;;;;;

 (def-fcg-cxn un-cxn
	((?un-word
		(args (?x))
		(syn-cat
			(lex-cat article)
			(number singular)
			(gender masculine)))
	<-
	(?un-word
		(HASH meaning ((indefinite ?x) (masculine ?x) (singular ?x)))
		--
		(HASH form ((string ?un-word "un"))))))


 (def-fcg-cxn une-cxn
	((?une-word
		(args (?x))
		(syn-cat
			(lex-cat article)
			(number singular)
			(gender feminine)))
	<-
	(?une-word
		(HASH meaning ((indefinite ?x) (feminine ?x) (singular ?x)))
		--
		(HASH form ((string ?une-word "une"))))))

 (def-fcg-cxn des.m-cxn
	((?des-word
		(args (?x))
		(syn-cat
			(lex-cat article)
			(number plural)
			(gender masculine)))
	<-
	(?des-word
		(HASH meaning ((indefinite ?x) (masculine ?x) (plural ?x)))
		--
		(HASH form ((string ?des-word "des.m"))))))

 (def-fcg-cxn des.f-cxn
 	((?des-word
 		(args (?x))
 		(syn-cat
 			(lex-cat article)
 			(number plural)
 			(gender feminine)))
 	<-
 	(?des-word
 		(HASH meaning ((indefinite ?x) (feminine ?x) (plural ?x)))
 		--
 		(HASH form ((string ?des-word "des.f"))))))

 (def-fcg-cxn le-cxn
	((?le-word
		(args (?x))
		(syn-cat
			(lex-cat article)
			(number singular)
			(gender masculine)))
	<-
	(?le-word
		(HASH meaning ((definite ?x) (singular ?x) (masculine ?x)))
		--
		(HASH form ((string ?le-word "le"))))))


 (def-fcg-cxn la-cxn
	((?la-word
		(args (?x))
		(syn-cat
			(lex-cat article)
			(number singular)
			(gender feminine)))
	<-
	(?la-word
		(HASH meaning ((definite ?x) (singular ?x) (feminine ?x)))
		--
		(HASH form ((string ?la-word "la"))))))

 (def-fcg-cxn les.m-cxn
 	((?les-word
 		(args (?x))
 		(syn-cat
 			(lex-cat article)
 			(number plural)
 			(gender masculine)))
 	<-
 	(?les-word
 		(HASH meaning ((definite ?x) (masculine ?x) (plural ?x)))
 		--
 		(HASH form ((string ?les-word "les.m"))))))

 (def-fcg-cxn les.f-cxn
	((?les-word
		(args (?x))
		(syn-cat
			(lex-cat article)
			(number plural)
			(gender feminine)))
	<-
	(?les-word
		(HASH meaning ((definite ?x) (feminine ?x) (plural ?x)))
		--
		(HASH form ((string ?les-word "les.f"))))))

;;;; Modifiers
;;;;;;;;;;;;;;

 (def-fcg-cxn s-noun-cxn
	((?s-word
		(args (?x))
		(resulting (plural))
		(syn-cat
			(lex-cat noun-modifier)))
	<-
	(?s-word
		(HASH meaning ((noun-modifier ?x)))
		--
		(HASH form ((string ?s-word "--s"))))))

 (def-fcg-cxn s-adj-cxn
	((?s-word
		(args (?x))
		(resulting (plural))
		(syn-cat
			(lex-cat adj-modifier)))
	<-
	(?s-word
		(HASH meaning ((plural-modifier ?x)))
		--
		(HASH form ((string ?s-word "-s"))))))

 (def-fcg-cxn e-cxn
	((?e-word
		(args (?x))
		(resulting (feminine))
		(syn-cat
			(lex-cat adj-modifier)))
	<-
	(?e-word
		(HASH meaning ((feminine-modifier ?x)))
		--
		(HASH form ((string ?e-word "-e"))))))


 (def-fcg-cxn es-cxn
	((?es-word
		(args (?x))
		(resulting (feminine plural))
		(syn-cat
			(lex-cat adj-modifier)))
	<-
	(?es-word
		(HASH meaning ((feminine-plural-modifier ?x)))
		--
		(HASH form ((string ?es-word "-es"))))))

;;;; Nouns
;;;;;;;;;;

 (def-fcg-cxn voiture-cxn
	((?voiture-word
		(args (?x))
		(sem-cat
			(sem-class (physobj inanimate feminine)))
		(syn-cat
			(lex-cat noun)
			(gender feminine))
		(applied 
			(basic-noun-cxn +)))
	<-
	(?voiture-word
		(HASH meaning ((voiture ?x)))
		--
		(HASH form ((string ?voiture-word "voiture"))))))


 (def-fcg-cxn pantalon-cxn
	((?pantalon-word
		(args (?x))
		(sem-cat
			(sem-class (physobj inanimate masculine)))
		(syn-cat
			(lex-cat noun)
			(gender masculine))
		(applied
			(basic-noun-cxn +)))
	<-
	(?pantalon-word
		(HASH meaning ((pantalon ?x)))
		--
		(HASH form ((string ?pantalon-word "pantalon"))))))


 (def-fcg-cxn singular-noun-cxn
	((?singular-noun-unit
		(referent ?x)
		(constituents (?noun-unit))
		(syn-cat
			(lex-cat noun)
			(gender ?gender)
			(number singular))
		(sem-cat
			(sem-class ?class))
		(applied
			(complex-noun-cxn +)))
	<-
	(?noun-unit
		(args (?x))
		(sem-cat
			(sem-class ?class))
		(applied
			(NOT (simple-noun-cxn +)))
		--
		(syn-cat
			(lex-cat noun)
			(gender ?gender))
		(applied
			(basic-noun-cxn +)
			(NOT (complex-noun-cxn +))
			(NOT (simple-noun-cxn +)))))
	:score 0.4)


 (def-fcg-cxn plural-noun-cxn
	((?plural-noun-unit
		(referent ?x)
		(constituents (?noun-unit ?modifier-unit))
		(syn-cat
			(lex-cat noun)
			(gender ?gender)
			(number plural))
		(sem-cat
			(sem-class ?class))
		(applied
			(complex-noun-cxn +)))
	(?noun-unit
		(modifier ?modifier-unit)
		(applied
			(simple-noun-cxn +)))
	<-
	(?plural-noun-unit
		--
		(HASH form ((meets ?noun-unit ?modifier-unit))))
	(?noun-unit
		(args (?x))
		(sem-cat
			(sem-class ?class))
		--
		(syn-cat
			(lex-cat noun)
			(gender ?gender))
		(applied
			(basic-noun-cxn +)
			(NOT (complex-noun-cxn +))))
	(?modifier-unit
		(args (?x))
		(resulting (plural))
		(meaning ((noun-modifier ?x)))
		--
		(syn-cat
			(lex-cat noun-modifier))
		(resulting (plural)))))

;;;; Adjectives
;;;;;;;;;;;;;;;

 (def-fcg-cxn petit-cxn
	((?petit-word
		(args (?x))
		(sem-cat
			(denotation size))
		(syn-cat
			(lex-cat adjective))
		(applied
			(basic-adj-cxn +)))
	<-
	(?petit-word
		(HASH meaning ((petit ?x)))
		--
		(HASH form ((string ?petit-word "petit"))))))

 (def-fcg-cxn vert-cxn
	((?vert-word
		(args (?x))
		(sem-cat
			(denotation color))
		(syn-cat
			(lex-cat adjective))
		(applied
			(basic-adj-cxn +)))
	<-
	(?vert-word
		(HASH meaning ((vert ?x)))
		--
		(HASH form ((string ?vert-word "vert"))))))

 ; Singular Feminine
 (def-fcg-cxn SF-adj-cxn
	((?SF-adj-unit
		(referent ?x)
		(constituents (?adj-unit ?modifier-unit))
		(syn-cat
			(lex-cat adjective)
			(gender feminine)
			(number singular))
		(sem-cat
			(denotation ?denotation))
		(applied
			(complex-adj-cxn +)))
	(?adj-unit
		(modifier ?modifier-unit)
		(applied
			(simple-adj-cxn +)))
	<-
	(?SF-adj-unit
		--
		(HASH form ((meets ?adj-unit ?modifier-unit))))
	(?adj-unit
		(args (?x))
		(sem-cat
			(denotation ?denotation))
		--
		(syn-cat
			(lex-cat adjective))
		(applied
			(basic-adj-cxn +)
			(NOT (complex-adj-cxn +))))
	(?modifier-unit
		(args (?x))
		(resulting (feminine))
		(meaning ((NOT (noun-modifier ?x))))
		--
		(syn-cat
			(lex-cat adj-modifier))
		(resulting (feminine)))))

 ; Plural Masculine
 (def-fcg-cxn PM-adj-cxn
	((?PM-adj-unit
		(referent ?x)
		(constituents (?adj-unit ?modifier-unit))
		(syn-cat
			(lex-cat adjective)
			(number plural)
			(gender masculine))
		(sem-cat
			(denotation ?denotation))
		(applied
			(complex-adj-cxn +)))
	(?adj-unit
		(modifier ?modifier-unit)
		(applied
			(simple-adj-cxn +)))
	<-
	(?PM-adj-unit
		--
		(HASH form ((meets ?adj-unit ?modifier-unit))))
	(?adj-unit
		(args (?x))
		(sem-cat
			(denotation ?denotation))
		--
		(syn-cat
			(lex-cat adjective))
		(applied
			(basic-adj-cxn +)
			(NOT (complex-adj-cxn +))))
	(?modifier-unit
		(args (?x))
		(resulting (plural))
		(meaning ((NOT (noun-modifier ?x))))
		--
		(syn-cat
			(lex-cat adj-modifier))
		(resulting (plural)))))

 ; Plural Feminine
 (def-fcg-cxn PF-adj-cxn
	((?PF-adj-unit
		(referent ?x)
		(constituents (?adj-unit ?modifier-unit))
		(syn-cat
			(lex-cat adjective)
			(gender feminine)
			(number plural))
		(sem-cat
			(denotation ?denotation))
		(applied
			(complex-adj-cxn +)))
	(?adj-unit
		(modifier ?modifier-unit)
		(applied
			(simple-adj-cxn +)))
	<-
	(?PF-adj-unit
		--
		(HASH form ((meets ?adj-unit ?modifier-unit))))
	(?adj-unit
		(args (?x))
		(sem-cat
			(denotation ?denotation))
		--
		(syn-cat
			(lex-cat adjective))
		(applied
			(basic-adj-cxn +)
			(NOT (complex-adj-cxn +))))
	(?modifier-unit
		(args (?x))
		(resulting (feminine plural))
		(meaning ((NOT (noun-modifier ?x))))
		--
		(syn-cat
			(lex-cat adj-modifier))
		(resulting (feminine plural)))))

  ; Singular Masculine
 (def-fcg-cxn SM-adj-cxn
	((?SM-adj-cxn
		(referent ?x)
		(constituents (?adj-unit))
		(syn-cat
			(lex-cat adjective)
			(gender masculine)
			(number singular))
		(sem-cat
			(denotation ?denotation))
		(applied
			(complex-adj-cxn +)))
	<-
	(?adj-unit
		(args (?x))
		(sem-cat
			(denotation ?denotation))
		(applied
			(NOT (simple-adj-cxn +)))
		--
		(syn-cat
			(lex-cat adjective))
		(applied
			(basic-adj-cxn +)
			(NOT (complex-adj-cxn +))
			(NOT (simple-adj-cxn +)))))
	:score 0.4)

;;;; Noun Phrases
;;;;;;;;;;;;;;;;;

 (def-fcg-cxn postfix-np-unit
	((?postfix-np-unit
		(referent ?x)
		(sem-cat
			(sem-function referring))
		(syn-cat
			(phrasal-cat NP)
			(agreement ?gender)
			(agreement ?number))
		(constituents (?art-unit ?noun-unit ?adj-unit)))
	(?art-unit
		(syn-cat
			(syn-fun (determiner ?noun-unit)))
		(applied
			(np-cxn +)))
	(?noun-unit
		(syn-cat
			(syn-fun (head ?postfix-np-unit)))
		(applied
			(np-cxn +)))
	(?adj-unit
		(syn-cat
			(syn-fun (attribute ?noun-unit)))
		(applied
			(np-cxn +)))
	<-
	(?art-unit
		(args (?x))
		(syn-cat
			(lex-cat article))
		(applied
			(NOT (np-cxn +)))
		--
		(applied
			(NOT (np-cxn +)))
		(syn-cat
			(lex-cat article)
			(number ?number)
			(gender ?gender)))
	(?noun-unit
		(referent ?x)
		(sem-cat
			(sem-class ?class))
		(applied
			(complex-noun-cxn +)
			(NOT (np-cxn +)))
		--
		(applied
			(complex-noun-cxn +)
			(NOT (np-cxn +)))
		(syn-cat
			(lex-cat noun)
			(number ?number)
			(gender ?gender)))
	(?adj-unit
		(referent ?x)
		(sem-cat
			(NOT (denotation size)))
		(applied
			(complex-adj-cxn +)
			(NOT (np-cxn +)))
		--
		(sem-cat
			(NOT (denotation size)))
		(applied
			(complex-adj-cxn +)
			(NOT (np-cxn +)))
		(syn-cat
			(lex-cat adjective)
			(number ?number)
			(gender ?gender))))
	:score 0.3)


 (def-fcg-cxn prefix-np-cxn
	((?prefix-np-unit
		(referent ?x)
		(sem-cat
			(sem-function referring))
		(syn-cat
			(phrasal-cat NP)
			(agreement ?gender)
			(agreement ?number))
		(constituents (?art-unit ?adj-unit ?noun-unit)))
	(?art-unit
		(syn-cat
			(syn-fun (determiner ?noun-unit)))
		(applied
			(np-cxn +)))
	(?adj-unit
		(syn-cat
			(syn-fun (attribute ?noun-unit)))
		(applied
			(np-cxn +)))
	(?noun-unit
		(syn-cat
			(syn-fun (head ?prefix-np-unit)))
		(applied
			(np-cxn +)))
	<-
	(?art-unit
		(args (?x))
		(syn-cat
			(lex-cat article))
		(applied
			(NOT (np-cxn +)))
		--
		(applied
			(NOT (np-cxn +)))
		(syn-cat
			(lex-cat article)
			(number ?number)
			(gender ?gender)))
	(?adj-unit
		(referent ?x)
		(sem-cat
			(NOT (denotation color)))
		(applied
			(complex-adj-cxn +)
			(NOT (np-cxn +)))
		--
		(sem-cat
			(NOT (denotation color)))
		(applied
			(complex-adj-cxn +)
			(NOT (np-cxn +)))
		(syn-cat
			(lex-cat adjective)
			(number ?number)
			(gender ?gender)))
	(?noun-unit
		(referent ?x)
		(sem-cat
			(sem-class ?class))
		(applied
			(complex-noun-cxn +)
			(NOT (np-cxn +)))
		--
		(applied
			(complex-noun-cxn +)
			(NOT (np-cxn +)))
		(syn-cat
			(lex-cat noun)
			(number ?number)
			(gender ?gender))))
	:score 0.3)

 (def-fcg-cxn double-np-cxn
 	((?double-np-unit
 		(referent ?x)
 		(sem-cat
 			(sem-function referring))
 		(syn-cat
 			(phrasal-cat NP)
 			(agreement ?gender)
 			(agreement ?number))
 		(constituents (?art-unit ?pre-adj-unit ?noun-unit ?post-adj-unit)))
 	(?art-unit
 		(syn-cat
 			(syn-fun (determiner ?noun-unit)))
 		(applied
 			(np-cxn +)))
 	(?pre-adj-unit
 		(syn-cat
 			(syn-fun (attribute ?noun-unit)))
 		(applied
 			(np-cxn +)))
 	(?noun-unit
 		(syn-cat
 			(syn-fun (head ?double-np-unit)))
 		(applied
 			(np-cxn +)))
 	(?post-adj-unit
 		(syn-cat
 			(syn-fun (attribute ?noun-unit)))
 		(applied
 			(np-cxn +)))
 	<-
 	(?art-unit
		(args (?x))
		(syn-cat
			(lex-cat article))
		--
		(syn-cat
			(lex-cat article)
			(number ?number)
			(gender ?gender)))
	(?pre-adj-unit
		(referent ?x)
		(sem-cat
			(NOT (denotation color)))
		(applied
			(complex-adj-cxn +))
		--
		(sem-cat
			(NOT (denotation color)))
		(applied
			(complex-adj-cxn +))
		(syn-cat
			(lex-cat adjective)
			(number ?number)
			(gender ?gender)))
	(?noun-unit
		(referent ?x)
		(sem-cat
			(sem-class ?class))
		(applied
			(complex-noun-cxn +))
		--
		(applied
			(complex-noun-cxn +))
		(syn-cat
			(lex-cat noun)
			(number ?number)
			(gender ?gender)))
	(?post-adj-unit
		(referent ?x)
		(sem-cat
			(NOT (denotation size)))
		(applied
			(complex-adj-cxn +))
		--
		(sem-cat
			(NOT (denotation size)))
		(applied
			(complex-adj-cxn +))
		(syn-cat
			(lex-cat adjective)
			(number ?number)
			(gender ?gender))))
	:score 0.6)

)


;;;; Test Cases
;;;;;;;;;;;;;;;

; 1. Un petit pantalon
(comprehend '("un" "petit" "pantalon"))
(formulate '((indefinite x) (masculine x) (singular x)
		(petit x)
		(pantalon x)))

; 2. Un pantalon vert
(comprehend '("un" "pantalon" "vert"))
(formulate '((indefinite x) (masculine x) (singular x)
		(vert x)
		(pantalon x)))

; 3. Une petite voiture
(comprehend '("une" "petit" "-e" "voiture"))
(formulate '((indefinite x) (feminine x) (singular x)
		(petit x) (feminine-modifier x)
		(voiture x)))

; 4. Une voiture verte
(comprehend '("une" "voiture" "vert" "-e"))
(formulate '((indefinite x) (feminine x) (singular x)
		(vert x) (feminine-modifier x)
		(voiture x)))

; 5. Des petits pantalons
(comprehend '("des.m" "petit" "-s" "pantalon" "--s"))
(formulate '((indefinite x) (masculine x) (plural x)
		(petit x) (plural-modifier x)
		(pantalon x) (noun-modifier x)))

; 6. Des pantalons verts
(comprehend '("des.m" "pantalon" "--s" "vert" "-s"))
(formulate '((indefinite x) (masculine x) (plural x)
		(pantalon x) (noun-modifier x)
		(vert x) (plural-modifier x)))

; 7. Les petites voitures
(comprehend '("les.f" "petit" "-es" "voiture" "--s"))
(formulate '((definite x) (feminine x) (plural x)
		(petit x) (feminine-plural-modifier x)
		(voiture x) (noun-modifier x)))

; 8. Les voitures vertes
(comprehend '("les.f" "voiture" "--s" "vert" "-es"))
(formulate '((definite x) (feminine x) (plural x)
		(vert x) (feminine-plural-modifier x)
		(voiture x) (noun-modifier x)))

; 9. Un petit pantalon vert
(comprehend '("un" "petit" "pantalon" "vert"))
(formulate '((indefinite x) (singular x) (masculine x)
	     (petit x) (pantalon x) (vert x)))

; 10. Une petite voiture verte
(comprehend '("une" "petit" "-e" "voiture" "vert" "-e"))
(formulate '((indefinite x) (singular x) (feminine x)
	     (petit x) (voiture x) (vert x)
             (feminine-modifier x) (feminine-modifier x)))

; 11. Des petits pantalons verts
(comprehend '("des.m" "petit" "-s" "pantalon" "--s" "vert" "-s"))
(formulate '((indefinite x) (plural x) (masculine x)
	     (petit x) (pantalon x) (vert x)
	     (plural-modifier x) (plural-modifier x)
	     (noun-modifier x)))

; 12. Les petites voitures vertes
(comprehend '("les.f" "petit" "-es" "voiture" "--s" "vert" "-es"))
(formulate '((definite x) (plural x) (feminine x)
	     (petit x) (voiture x) (vert x)
	     (feminine-plural-modifier x) (feminine-plural-modifier x)
	     (noun-modifier x)))






