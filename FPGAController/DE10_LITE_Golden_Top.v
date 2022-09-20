// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.1 :| Alexandra Du			:| 06/01/2016:| Added Verilog file
// ============================================================================


//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

`define ENABLE_ADC_CLOCK
`define ENABLE_CLOCK1
`define ENABLE_CLOCK2
`define ENABLE_SDRAM
`define ENABLE_HEX0
`define ENABLE_HEX1
`define ENABLE_HEX2
`define ENABLE_HEX3
`define ENABLE_HEX4
`define ENABLE_HEX5
`define ENABLE_KEY
`define ENABLE_LED
`define ENABLE_SW
`define ENABLE_VGA
`define ENABLE_ACCELEROMETER
`define ENABLE_ARDUINO
`define ENABLE_GPIO

module DE10_LITE_Golden_Top(

	//////////// ADC CLOCK: 3.3-V LVTTL //////////
`ifdef ENABLE_ADC_CLOCK
	input 		          		ADC_CLK_10,
`endif
	//////////// CLOCK 1: 3.3-V LVTTL //////////
`ifdef ENABLE_CLOCK1
	input 		          		MAX10_CLK1_50,
`endif
	//////////// CLOCK 2: 3.3-V LVTTL //////////
`ifdef ENABLE_CLOCK2
	input 		          		MAX10_CLK2_50,
`endif

	//////////// SDRAM: 3.3-V LVTTL //////////
`ifdef ENABLE_SDRAM
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,
`endif

	//////////// SEG7: 3.3-V LVTTL //////////
`ifdef ENABLE_HEX0
	output		     [7:0]		HEX0,
`endif
`ifdef ENABLE_HEX1
	output		     [7:0]		HEX1,
`endif
`ifdef ENABLE_HEX2
	output		     [7:0]		HEX2,
`endif
`ifdef ENABLE_HEX3
	output		     [7:0]		HEX3,
`endif
`ifdef ENABLE_HEX4
	output		     [7:0]		HEX4,
`endif
`ifdef ENABLE_HEX5
	output		     [7:0]		HEX5,
`endif

	//////////// KEY: 3.3 V SCHMITT TRIGGER //////////
`ifdef ENABLE_KEY
	input 		     [1:0]		KEY,
`endif

	//////////// LED: 3.3-V LVTTL //////////
`ifdef ENABLE_LED
	output		     [9:0]		LEDR,
`endif

	//////////// SW: 3.3-V LVTTL //////////
`ifdef ENABLE_SW
	input 		     [9:0]		SW,
`endif

	//////////// VGA: 3.3-V LVTTL //////////
`ifdef ENABLE_VGA
	output		     [3:0]		VGA_B,
	output		     [3:0]		VGA_G,
	output		          		VGA_HS,
	output		     [3:0]		VGA_R,
	output		          		VGA_VS,
`endif

	//////////// Accelerometer: 3.3-V LVTTL //////////
`ifdef ENABLE_ACCELEROMETER
	output		          		GSENSOR_CS_N,
	input 		     [2:1]		GSENSOR_INT,
	output		          		GSENSOR_SCLK,
	inout 		          		GSENSOR_SDI,
	inout 		          		GSENSOR_SDO,
`endif

	//////////// Arduino: 3.3-V LVTTL //////////
`ifdef ENABLE_ARDUINO
	inout 		    [15:0]		ARDUINO_IO,
	inout 		          		ARDUINO_RESET_N,
`endif

	//////////// GPIO, GPIO connect to GPIO Default: 3.3-V LVTTL //////////
`ifdef ENABLE_GPIO
	inout 		    [35:0]		GPIO
`endif
);



//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic [31:0] hard_inx;
	logic [31:0] hard_outx;
	logic [31:0] hard_iny;
	logic [31:0] hard_outy;
	logic [31:0] hard_inz;
	logic [31:0] hard_outz;
	logic [3:0] hard_control;



//=======================================================
//  Structural coding
//=======================================================
hard filterx(.reset(hard_control[2]), .clk_coeff(hard_control[1]), .clk_sample(hard_control[0]), .in(hard_inx), .out(hard_outx));
hard filtery(.reset(hard_control[2]), .clk_coeff(hard_control[1]), .clk_sample(hard_control[0]), .in(hard_iny), .out(hard_outy));
//hard filterz(.reset(hard_control[2]), .clk_coeff(hard_control[1]), .clk_sample(hard_control[0]), .in(hard_inz), .out(hard_outz));

snake u0 (
        .clk_clk                           (MAX10_CLK2_50),                           //                        clk.clk
        .reset_reset_n                     (1'b1),                     //                      reset.reset_n
        .altpll_locked_conduit_export    (),    //    altpll_0_locked_conduit.export
        .altpll_phasedone_conduit_export (), 	// altpll_0_phasedone_conduit.export
        .altpll_areset_conduit_export    (),     //    altpll_0_areset_conduit.export

		//SDRAM
		.clk_sdram_clk(DRAM_CLK),                  //               clk_sdram.clk //Might be borken, rename to qsys pin name
	   .sdram_wire_addr(DRAM_ADDR),                //              sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                  //                        .ba
		.sdram_wire_cas_n(DRAM_CAS_N),               //                        .cas_n
		.sdram_wire_cke(DRAM_CKE),                 //                        .cke
		.sdram_wire_cs_n(DRAM_CS_N),                //                        .cs_n
		.sdram_wire_dq(DRAM_DQ),                  //                        .dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),                 //                        .dqm
		.sdram_wire_ras_n(DRAM_RAS_N),               //                        .ras_n
		.sdram_wire_we_n(DRAM_WE_N),                 //                        .we_n
		
		//Accelerometer
		.accelerometer_spi_external_interface_I2C_SDAT      (GSENSOR_SDI),   // accelerometer_spi_external_interface.I2C_SDAT
		.accelerometer_spi_external_interface_I2C_SCLK      (GSENSOR_SCLK),  //.I2C_SCLK
		.accelerometer_spi_external_interface_G_SENSOR_CS_N (GSENSOR_CS_N), //.G_SENSOR_CS_N
		.accelerometer_spi_external_interface_G_SENSOR_INT  (GSENSOR_INT[1]), //.G_SENSOR_INT
		
		//Button
		.button_external_connection_export (KEY[1:0]), // button_external_connection.export
		.switch_external_connection_export (SW[9:0]), // switch_external_connection.export
		.led_external_connection_export    (LEDR[9:0]),    //    led_external_connection.export
		.hex0_external_connection_export   (HEX0),   //   hex0_external_connection.export
		.hex1_external_connection_export   (HEX1),   //   hex1_external_connection.export
		.hex2_external_connection_export   (HEX2),   //   hex2_external_connection.export
		.hex3_external_connection_export   (HEX3),   //   hex3_external_connection.export
		.hex4_external_connection_export   (HEX4),   //   hex4_external_connection.export
		.hex5_external_connection_export   (HEX5),    //   hex5_external_connection.export
		

		.hardware_clocks_external_connection_export         (hard_control),          //  hardware_clocks_external_connection.export
		.hardware_in_x_external_connection_export           (hard_outx),           //    hardware_in_x_external_connection.export
		.hardware_out_x_external_connection_export          (hard_inx),          //   hardware_out_x_external_connection.export
		.hardware_in_y_external_connection_export           (hard_outy),           //    hardware_in_y_external_connection.export
		.hardware_out_y_external_connection_export          (hard_iny),          //   hardware_out_y_external_connection.export
		.hardware_in_z_external_connection_export           (hard_outz),           //    hardware_in_z_external_connection.export
		.hardware_out_z_external_connection_export          (hard_inz)           //   hardware_out_z_external_connection.export
	
	 );
	 

endmodule