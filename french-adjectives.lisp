;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; POSITION OF FRENCH ADJECTIVES ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; 1. Load and set up FCG
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
			(sem-class set))
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

 ;;;; Nouns
 ;;;;;;;;;;

 (def-fcg-cxn voiture-cxn
	((?voiture-word
		(args (?x))
		(sem-cat
			(sem-class (physobj inanimate feminine)))
		(syn-cat
			(lex-cat noun)
			(gender feminine)))
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
			(gender masculine)))
	<-
	(?pantalon-word
		(HASH meaning ((pantalon ?x)))
		--
		(HASH form ((string ?pantalon-word "pantalon"))))))

 ;;;; Adjectives
 ;;;;;;;;;;;;;;;

 ; Size, numbers is prenominal
 ; Color, form is postnominal
 (def-fcg-cxn petit-cxn
	((?petit-word
		(args (?x))
		(sem-cat
			(denotation size))
		(syn-cat
			(lex-cat adjective)))
	<-
	(?petit-word
		(HASH meaning ((petit ?x)))
		--
		(HASH form ((string ?petit-word "petit"))))))

 (def-fcg-cxn deuxieme-cxn
 	((?deuxieme-word
 		(args (?x))
 		(sem-cat
 			(denotation number))
 		(syn-cat
 			(lex-cat adjective)))
 	<-
 	(?deuxieme-word
 		(HASH meaning ((deuxieme ?x)))
 		--
 		(HASH form ((string ?deuxieme-word "deuxième"))))))

 (def-fcg-cxn carre-cxn
 	((?carre-word
 		(args (?x))
 		(sem-cat
 			(denotation form))
 		(syn-cat
 			(lex-cat adjective)))
 	<-
 	(?carre-word
 		(HASH meaning ((carre ?x)))
 		--
 		(HASH form ((string ?carre-word "carré"))))))

 (def-fcg-cxn vert-cxn
	((?vert-word
		(args (?x))
		(sem-cat
			(denotation color))
		(syn-cat
			(lex-cat adjective)))
	<-
	(?vert-word
		(HASH meaning ((vert ?x)))
		--
		(HASH form ((string ?vert-word "vert"))))))

 ;;;; Noun Phrases
 ;;;;;;;;;;;;;;;;;
 
 (def-fcg-cxn prenominal-np-cxn
	((?prenominal-np-unit
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
			(syn-fun 
				(determiner ?noun-unit)))
		(applied
			(np-cxn +)))
	(?adj-unit
		(syn-cat
			(syn-fun 
				(attribute ?noun-unit))
			(gender ?gender)
			(number ?number))
		(applied
			(np-cxn +)))
	(?noun-unit
		(syn-cat
			(syn-fun 
				(head ?prefix-np-unit))
			(number ?number))
		(applied
			(np-cxn +)))
	<-
	(?prenominal-np-unit
		--
		(HASH form ((meets ?art-unit ?adj-unit)
			    (meets ?adj-unit ?noun-unit))))
	(?art-unit
		(args (?x))
		(applied
			(NOT (np-cxn +)))
		--
		(syn-cat
			(lex-cat article)
			(number ?number)
			(gender ?gender)))
	(?adj-unit
		(args (?x))
		(sem-cat
			(NOT (denotation color))
			(NOT (denotation form)))
		(applied
			(NOT (np-cxn +)))
		--
		(sem-cat
			(NOT (denotation color))
			(NOT (denotation form)))
		(syn-cat
			(lex-cat adjective)))
	(?noun-unit
		(args (?x))
		(sem-cat
			(sem-class ?class))
		(applied
			(NOT (np-cxn +)))
		--
		(syn-cat
			(lex-cat noun)
			(gender ?gender))))
	:score 0.4)

 (def-fcg-cxn postnominal-np-cxn
	((?postnominal-np-unit
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
			(syn-fun 
				(determiner ?noun-unit)))
		(applied
			(np-cxn +)))
	(?noun-unit
		(syn-cat
			(syn-fun 
				(head ?postfix-np-unit))
			(number ?number))
		(applied
			(np-cxn +)))
	(?adj-unit
		(syn-cat
			(syn-fun 
				(attribute ?noun-unit))
			(gender ?gender)
			(number ?number))
		(applied
			(np-cxn +)))
	<-
	(?postnominal-np-unit
		--
		(HASH form ((meets ?art-unit ?noun-unit)
			    (meets ?noun-unit ?adj-unit))))
	(?art-unit
		(args (?x))
		(applied
			(NOT (np-cxn +)))
		--
		(syn-cat
			(lex-cat article)
			(gender ?gender)
			(number ?number)))
	(?noun-unit
		(args (?x))
		(sem-cat
			(sem-class ?class))
		(applied
			(NOT (np-cxn +)))
		--
		(syn-cat
			(lex-cat noun)
			(gender ?gender)))
	(?adj-unit
		(args (?x))
		(sem-cat
			(NOT (denotation size))
			(NOT (denotation number)))
		(applied
			(NOT (np-cxn +)))
		--
		(sem-cat
			(NOT (denotation size))
			(NOT (denotation number)))
		(syn-cat
			(lex-cat adjective))))
	:score 0.4)

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
 			(syn-fun
 				(determiner ?noun-unit)))
 		(applied
			(np-cxn +)))
 	(?pre-adj-unit
 		(syn-cat
 			(syn-fun
 				(attribute ?noun-unit))
 			(gender ?gender)
 			(number ?number))
 		(applied
			(np-cxn +)))
 	(?noun-unit
 		(syn-cat
 			(syn-fun
 				(head ?double-np-unit))
 			(number ?number))
 		(applied
			(np-cxn +)))
 	(?post-adj-unit
 		(syn-cat
 			(syn-fun
 				(attribute ?noun-unit))
 			(gender ?gender)
 			(number ?number))
 		(applied
			(np-cxn +)))
 	<-
 	(?double-np-unit
 		--
 		(HASH form ((meets ?art-unit ?pre-adj-unit)
 			    (meets ?pre-adj-unit ?noun-unit)
 			    (meets ?noun-unit ?post-adj-unit))))
 	(?art-unit
 		(args (?x))
 		--
 		(syn-cat
 			(lex-cat article)
 			(number ?number)
 			(gender ?gender)))
 	(?pre-adj-unit
 		(args (?x))
 		(sem-cat
			(NOT (denotation color))
			(NOT (denotation form)))
 		--
 		(sem-cat
			(NOT (denotation color))
			(NOT (denotation form)))
 		(syn-cat
 			(lex-cat adjective)))
 	(?noun-unit
		(args (?x))
		(sem-cat
			(sem-class ?class))
		--
		(syn-cat
			(lex-cat noun)
			(gender ?gender)))
 	(?post-adj-unit
 		(args (?x))
 		(sem-cat
			(NOT (denotation size))
			(NOT (denotation number)))
 		--
 		(sem-cat
			(NOT (denotation size))
			(NOT (denotation number)))
 		(syn-cat
 			(lex-cat adjective))))
	:score 0.6)

)

;;;; Test Cases
;;;;;;;;;;;;;;;

; 1. Un petit pantalon
(comprehend '("un" "petit" "pantalon"))
(formulate '((indefinite x) (masculine x) (singular x)
		(petit x) (pantalon x)))

; 2. Un pantalon vert
(comprehend '("un" "pantalon" "vert"))
(formulate '((indefinite x) (masculine x) (singular x)
		(vert x) (pantalon x)))

; 3. Une deuxieme voiture
(comprehend '("une" "deuxième" "voiture"))
(formulate '((indefinite x) (feminine x) (singular x)
		(deuxieme x) (voiture x)))

; 4. Une voiture carrée
(comprehend '("une" "voiture" "carré"))
(formulate '((indefinite x) (feminine x) (singular x)
		(carre x) (voiture x)))

; 5. Des petits pantalons
(comprehend '("des.m" "petit" "pantalon"))
(formulate '((indefinite x) (masculine x) (plural x)
		(petit x) (pantalon x)))

; 6. Des pantalons verts
(comprehend '("des.m" "pantalon" "vert"))
(formulate '((indefinite x) (masculine x) (plural x)
		(pantalon x) (vert x)))

; 7. Les deuxiemes voitures
(comprehend '("les.f" "deuxième" "voiture"))
(formulate '((definite x) (feminine x) (plural x)
		(deuxieme x) (voiture x)))

; 8. Les voitures carrées
(comprehend '("les.f" "voiture" "carré"))
(formulate '((definite x) (feminine x) (plural x)
		(carre x) (voiture x)))

; 9. Un petit pantalon vert
(comprehend '("un" "petit" "pantalon" "vert"))
(formulate '((indefinite x) (singular x) (masculine x)
	     (petit x) (pantalon x) (vert x)))

; 10. Une deuxième voiture carrée
(comprehend '("une" "deuxième" "voiture" "carré"))
(formulate '((indefinite x) (singular x) (feminine x)
	     (deuxieme x) (voiture x) (carre x)))

; 11. Des petits pantalons verts
(comprehend '("des.m" "petit" "pantalon" "vert"))
(formulate '((indefinite x) (plural x) (masculine x)
	     (petit x) (pantalon x) (vert x)))

; 12. Les deuxièmes voitures carrées
(comprehend '("les.f" "deuxième" "voiture" "carré"))
(formulate '((definite x) (plural x) (feminine x)
	     (deuxieme x) (voiture x) (carre x)))


