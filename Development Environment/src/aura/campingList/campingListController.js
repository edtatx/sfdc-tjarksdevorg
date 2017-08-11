({
doInit : function(component, event, helper){
    var action =  component.get("c.getItems");
    action.setCallback(this,function(response){
        var state = response.getState();
        if(component.isValid() && state === "SUCCESS"){
            component.set("v.items", response.getReturnValue());
        }else if(state === "ERROR"){
            console.log('Failed with below state: ' + state);
            var errors = response.getError();
            if (errors) {
                if (errors[0] && errors[0].message) {
                    console.log("Error message: " + errors[0].message);
                }else{
                    console.log("Unknown Error");
                }
            }
        }
    });

    $A.enqueueAction(action); 
},

handleAdditem : function(component, event, helper){
    console.log("adding item");
    var action = component.get("c.saveItem");
    var allCampings = component.get("v.items");
    var item = event.getParam("item");
    		action.setParams({"item": item});
    		action.setCallback(this, function(response){
        		var state = response.getState();
                console.log("State: "+state);
                if (component.isValid() && state === "SUCCESS") {
            		allCampings.push(item);
            		component.set("v.items",allCampings);
        		}
    		});
    		$A.enqueueAction(action);
    //helper.createCampings(component, event.getParam("item"));
}
})