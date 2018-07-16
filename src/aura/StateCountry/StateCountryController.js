({
	loadPicklists : function(component, event, helper) {
        var existingValues = component.get("v.fieldDependencies");
        if($A.util.isUndefinedOrNull(existingValues) || existingValues.length === 0){
            var action = component.get("c.getStateCountryValues");
            action.setCallback(this, function(response) {
            	if(component.isValid()){
                    existingValues = response.getReturnValue();
                    var countryValues = [];
                    var countryCode = component.get("v.countryCode");
                    var stateCode = component.get("v.stateCode");
                    var countrySelected;
                    var stateSelected;
                    var stateValues = [];
                    component.set("v.fieldDependencies", existingValues);
                    for(var each in existingValues){
                        if(existingValues[each].countryCode === countryCode){
                            countrySelected = existingValues[each].country;
                            for(var eachInner in existingValues[each].stateCodes){
                                stateValues.push(existingValues[each].states[eachInner]);
                                if(existingValues[each].stateCodes[eachInner] === stateCode){
                                    stateSelected = existingValues[each].states[eachInner];
                                }
                            }
                        }
                        countryValues.push(existingValues[each].country);
                    }
                    countryValues.sort();
                    component.set("v.countryValues", countryValues);
                    component.set("v.stateValues", stateValues);
                    component.set("v.noState", stateValues.length === 0);
                    if(!$A.util.isUndefinedOrNull(countrySelected)){
                    	component.set("v.countrySelected", countrySelected);
                    }
                    if(!$A.util.isUndefinedOrNull(stateSelected)){
                    	component.set("v.stateSelected", stateSelected);
                    }
                }
            });
            $A.enqueueAction(action);
        }
	},
    changeCountry : function(component, event, helper){
        var existingValues = component.get("v.fieldDependencies");
        var countrySelected = component.get("v.countrySelected");
        if(!$A.util.isUndefinedOrNull(existingValues)){
            var stateValues = [];
            var countryCode;
            for(var each in existingValues){
                if(existingValues[each].country === countrySelected){
                    countryCode = existingValues[each].countryCode;
                    for(var eachInner in existingValues[each].states){
                        stateValues.push(existingValues[each].states[eachInner]);
                    }
                    break;
                }
            }
            component.set("v.countryCode", countryCode);
            stateValues.sort();
            component.set("v.stateValues", stateValues);
            component.set("v.stateSelected", "");
            component.set("v.stateCode", "");
            component.set("v.noState", stateValues.length === 0);
        }
    },
    changeState : function(component, event, helper){
        var existingValues = component.get("v.fieldDependencies");
        var stateSelected = component.get("v.stateSelected");
        var countrySelected = component.get("v.countrySelected");
        if(!$A.util.isUndefinedOrNull(existingValues)){
            var stateCode;
            for(var each in existingValues){
                if(existingValues[each].country === countrySelected){
                    for(var eachInner in existingValues[each].stateCodes){
                        if(existingValues[each].states[eachInner] === stateSelected){
                            stateCode = existingValues[each].stateCodes[eachInner];
                        }
                    }
                    break;
                }
            }
            component.set("v.stateCode", stateCode);
        }
    }
})