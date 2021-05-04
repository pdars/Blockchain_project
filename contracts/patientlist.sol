pragma solidity ^0.4.2;

contract patientlist {
    string public pName;
    string public phn;
    address owner;

    function patientlist () public {
        pName = "Patient 1";
        phn = "12333444344";
        owner=msg.sender;
    }
    
     struct Patient_Record{
        string patientName;
        string phn;
    }
    
    Patient_Record[] public record_data;

    function setpName (string _name) public {
        require(owner==msg.sender);
        pName = _name;
    }
    
     function setphn (string _phn) public {
        require(owner==msg.sender);
        phn = _phn;
    }
    
    function savedata() public{
        require(owner==msg.sender);
        Patient_Record memory newPatient = Patient_Record({patientName:pName, phn:phn});
        record_data.push(newPatient);
    }
    
    function delete_data(uint index) public {
      require(owner==msg.sender);
     record_data[index]=record_data[record_data.length-1];
     record_data.length--;
    }
}