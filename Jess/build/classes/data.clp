(defglobal ?*diseases* = (create$ VitaminA__deficiency VitaminB1__deficiency VitaminB2__deficiency Niacin VitaminB5__deficiency VitaminB6__deficiency VitaminC__deficiency Phosphorus__deficiency Zinc__deficiency Magnesium__deficiency Fever Malaria Dengue_Fever HIV ))
(defglobal ?*temp* = (create$))
(deftemplate symptom (slot bp) (slot pr) (slot va))


(defrule VitaminA__deficiency
   (or 
        (symptom (bp teeth) (pr type) (va faulty))
        (symptom (bp bone) (pr formation) (va slow))
    )
    =>
    (if (member$ VitaminA__deficiency ?*diseases*)
        then (if (not (member$ VitaminA__deficiency ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* VitaminA__deficiency))
        )
    )
)

(defrule VitaminB1__deficiency
   (or 
        (symptom (bp muscle) (pr strength) (va weak))
        (symptom (bp appetite) (pr quantity) (va lack))
        (symptom (bp sense) (pr type) (va tingling))
        (symptom (bp hand) (pr sense) (va loss))
        (symptom (bp legs) (pr sense) (va loss))
        (symptom (bp breathing) (pr rate) (va low))
    )
    =>
    (if (member$ VitaminB1__deficiency ?*diseases*)
        then (if (not (member$ VitaminB1__deficiency ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* VitaminB1__deficiency))
        )
    )
)

(defrule VitaminB2__deficiency
   (or 
        (symptom (bp throat) (pr type) (va swollen))
        (symptom (bp throat) (pr type) (va sore))
        (symptom (bp tongue) (pr type) (va shiny-red))
        (symptom (bp appetite) (pr quantity) (va lack))
        (symptom (bp tongue) (pr type) (va sore))
        (symptom (bp tongue) (pr type) (va inflamed))
        (symptom (bp skin) (pr effect) (va peeling_around_the_nose))
    )
    =>
    (if (member$ VitaminB2__deficiency ?*diseases*)
        then (if (not (member$ VitaminB2__deficiency ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* VitaminB2__deficiency))
        )
    )
)

(defrule Niacin
   (or 
        (symptom (bp skin) (pr type) (va dry))
        (symptom (bp skin) (pr type) (va scaly))
        (symptom (bp skin) (pr type) (va cracked))
        (symptom (bp muscle) (pr strength) (va weak))
        (symptom (bp muscle) (pr pain) (va high))
        (symptom (bp brain) (pr ache) (va high))
    )
    =>
    (if (member$ Niacin ?*diseases*)
        then (if (not (member$ Niacin ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* Niacin))
        )
    )
)

(defrule VitaminB5__deficiency
   (or 
        (symptom (bp legs) (pr feet) (va numbness))
        (symptom (bp legs) (pr feet) (va pain))
        (symptom (bp legs) (pr sense) (va loss))
        (symptom (bp breathing) (pr rate) (va high))
    )
    =>
    (if (member$ VitaminB5__deficiency ?*diseases*)
        then (if (not (member$ VitaminB5__deficiency ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* VitaminB5__deficiency))
        )
    )
)

(defrule VitaminB6__deficiency
   (or 
        (symptom (bp skin) (pr effect) (va dermatitis))
        (symptom (bp edges) (pr color) (va brown_spots))
        (symptom (bp hand) (pr sense) (va loss))
        (symptom (bp legs) (pr sense) (va loss))
        (symptom (bp muscle) (pr strength) (va weak))
        (symptom (bp legs) (pr effect) (va cramp))
        (symptom (bp brain) (pr ache) (va high))
        (symptom (bp breathing) (pr rate) (va high))
    )
    =>
    (if (member$ VitaminB6__deficiency ?*diseases*)
        then (if (not (member$ VitaminB6__deficiency ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* VitaminB6__deficiency))
        )
    )
)

(defrule VitaminC__deficiency
   (or 
        (symptom (bp skin) (pr inner) (va bruising))
        (symptom (bp skin) (pr inner) (va bleeding))
        (symptom (bp bones) (pr type) (va swollen))
        (symptom (bp skin) (pr inner) (va bleeding))
        (symptom (bp muscle) (pr strength) (va weak))
        (symptom (bp appetite) (pr quantity) (va lack))
    )
    =>
    (if (member$ VitaminC__deficiency ?*diseases*)
        then (if (not (member$ VitaminC__deficiency ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* VitaminC__deficiency))
        )
    )
)

(defrule Phosphorus__deficiency
   (or 
        (symptom (bp teeth) (pr grow) (va weak))
        (symptom (bp teeth) (pr decay) (va fast))
        (symptom (bp bones) (pr development) (va poor))
    )
    =>
    (if (member$ Phosphorus__deficiency ?*diseases*)
        then (if (not (member$ Phosphorus__deficiency ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* Phosphorus__deficiency))
        )
    )
)

(defrule Zinc__deficiency
   (or 
        (symptom (bp hair) (pr width) (va thin))
        (symptom (bp acne/rashes) (pr type) (va itchy))
    )
    =>
    (if (member$ Zinc__deficiency ?*diseases*)
        then (if (not (member$ Zinc__deficiency ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* Zinc__deficiency))
        )
    )
)

(defrule Magnesium__deficiency
   (or 
        (symptom (bp sleep) (pr time) (va low))
        (symptom (bp chest) (pr pain) (va high))
    )
    =>
    (if (member$ Magnesium__deficiency ?*diseases*)
        then (if (not (member$ Magnesium__deficiency ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* Magnesium__deficiency))
        )
    )
)

(defrule Fever
   (or 
        (symptom (bp sweat) (pr type) (va high))
        (symptom (bp head) (pr type) (va ache))
        (symptom (bp muscle) (pr pain) (va low))
        (symptom (bp weakness) (pr type) (va low))
    )
    =>
    (if (member$ Fever ?*diseases*)
        then (if (not (member$ Fever ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* Fever))
        )
    )
)

(defrule Malaria
   (or 
        (symptom (bp fever) (pr time) (va more))
        (symptom (bp head) (pr ache) (va low))
        (symptom (bp vomiting) (pr count) (va less))
        (symptom (bp back) (pr pain) (va low))
    )
    =>
    (if (member$ Malaria ?*diseases*)
        then (if (not (member$ Malaria ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* Malaria))
        )
    )
)

(defrule Dengue_Fever
   (or 
        (symptom (bp rashes) (pr type) (va itchy))
        (symptom (bp throat) (pr type) (va sore))
        (symptom (bp spots) (pr color) (va red))
        (symptom (bp fever) (pr time) (va more))
        (symptom (bp head) (pr ache) (va low))
        (symptom (bp vomiting) (pr count) (va less))
        (symptom (bp back) (pr pain) (va low))
        (symptom (bp sweat) (pr type) (va high))
        (symptom (bp head) (pr type) (va ache))
        (symptom (bp muscle) (pr pain) (va low))
        (symptom (bp weakness) (pr type) (va low))
    )
    =>
    (if (member$ Dengue_Fever ?*diseases*)
        then (if (not (member$ Dengue_Fever ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* Dengue_Fever))
        )
    )
)

(defrule HIV
   (or 
        (symptom (bp throat) (pr type) (va sore))
        (symptom (bp sweat) (pr type) (va high))
        (symptom (bp head) (pr type) (va ache))
        (symptom (bp muscle) (pr pain) (va low))
        (symptom (bp weakness) (pr type) (va high))
        (symptom (bp rashes) (pr type) (va itchy))
        (symptom (bp sweat) (pr time) (va night))
        (symptom (bp mouth) (pr type) (va ulcers))
        (symptom (bp weight) (pr type) (va loss))
        (symptom (bp memory) (pr type) (va loss))
    )
    =>
    (if (member$ HIV ?*diseases*)
        then (if (not (member$ HIV ?*temp*)) 
            then (bind ?*temp* (create$ ?*temp* HIV))
        )
    )
)

