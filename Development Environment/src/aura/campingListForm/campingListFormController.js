({
submitForm : function(component, event, helper) {
    console.log('Entered the saveCamping');
    var validCamping = true;
    var campingName = component.find("campName").get("v.value");
    var campingQuantity = component.find("campQuantity").get("v.value");
    var campingPrice = component.find("campPrice").get("v.value");

    if($A.util.isEmpty(campingName)){
        validCamping = false;
        component.find("campName").set("v.errors",[{message: "Name can't be blank"}]);
    }else{
        component.find("campName").set("v.errors",null);
    }
    if($A.util.isEmpty(campingQuantity)){
        validCamping = false;
        component.find("campQuantity").set("v.errors",[{message: "Quantity can't be blank"}]);
    }else{
        component.find("campName").set("v.errors",null);
    }
    if($A.util.isEmpty(campingPrice)){
        validCamping = false;
        component.find("campPrice").set("v.errors",[{message: "Price can't be blank"}]);
    }else{
        component.find("campName").set("v.errors",null);
    }

    if(validCamping){
        var newCamping = component.get("v.newItem");
        helper.createItem(component,newCamping);
    }
}
})