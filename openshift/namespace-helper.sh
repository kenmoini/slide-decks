#!/bin/bash

oc new-project test-sites-slides-fiercesw-network --display-name="[TEST][Site] Fierce Network Slides"
oc new-project stage-sites-slides-fiercesw-network --display-name="[STAGE][Site] Fierce Network Slides"
oc new-project sites-slides-fiercesw-network --display-name="[PROD][Site] Fierce Network Slides"

oc policy add-role-to-user edit system:serviceaccount:integrated-cicd:jenkins -n test-sites-slides-fiercesw-network
oc policy add-role-to-user edit system:serviceaccount:integrated-cicd:jenkins -n stage-sites-slides-fiercesw-network
oc policy add-role-to-user edit system:serviceaccount:integrated-cicd:jenkins -n sites-slides-fiercesw-network

oc adm pod-network join-projects --to=integrated-cicd test-site-slides-fiercesw-network stage-site-slides-fiercesw-network site-slides-fiercesw-network >/dev/null 2>&1
