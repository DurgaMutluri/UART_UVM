/**********************************************************************
 input sequncer  program for FIFO Testbench
*************************************************************************
NAME:              Durga Bhavani M

************************************************************************/

`ifndef INPUT_SEQUENCE_SV 
`define INPUT_SEQUENCE_SV

class input_sequence extends uvm_sequence #(input_trans);
  `uvm_object_utils(input_sequence)

input_trans mydata1;

function new (string name ="input_sequence");
    super.new(name);
  endfunction 

// Raise in pre_body so the objection is only raised for root sequences.
  // There is no need to raise for sub-sequences since the root sequence
  // will encapsulate the sub-sequence. 
 /* virtual task pre_body();
    if (starting_phase!=null) begin
       `uvm_info(get_type_name(),
		 $sformatf("%s pre_body() raising %s objection", 
			   get_sequence_path(),
			   starting_phase.get_name()), UVM_MEDIUM);
       starting_phase.raise_objection(this);
    end
  endtask

  // Drop the objection in the post_body so the objection is removed when
  // the root sequence is complete. 
  virtual task post_body();
    if (starting_phase!=null) begin
       `uvm_info(get_type_name(),
		 $sformatf("%s post_body() dropping %s objection", 
			   get_sequence_path(),
			   starting_phase.get_name()), UVM_MEDIUM);
    starting_phase.drop_objection(this);
    end
  endtask
  endclass */





//rand bit 

 virtual task body();
    `uvm_info("input_sequence","EXECUTING Sequence ....",UVM_MEDIUM);
    //req = input_trans::type_id::create("req");
    for(int i=0;i<no_of_transactions;i++) 
     begin 
	mydata1=input_trans::type_id::create("mydata1");
       start_item(mydata1);
	       
	if(!mydata1.randomize)
         `uvm_error("RANDFAL","Randomization Failed");
    	//`uvm_info("sequence_info",$sformat("Randomization passed with  =%0d",req.data),"");
       finish_item(mydata1);
     end 
  endtask 
endclass 

`endif 
