----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2021 00:49:03
-- Design Name: 
-- Module Name: top_layer_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_layer_tb is
--  Port ( );
end top_layer_tb;

architecture Behavioral of top_layer_tb is
    COMPONENT top_layer is
        Port ( 
            a_top       : IN std_logic_vector(3 downto 0);
            b_top       : IN std_logic_vector(3 downto 0);
            op_top      : IN std_logic_vector(1 downto 0);
            o_top       : OUT std_logic_vector(7 downto 0)
        );
    END COMPONENT;  
    
    SIGNAL signal_a_net: std_logic_vector(3 downto 0); 
    SIGNAL signal_b_net: std_logic_vector(3 downto 0); 
    SIGNAL signal_op_net: std_logic_vector(1 downto 0); 
    SIGNAL signal_o_net: std_logic_vector(7 downto 0); 

BEGIN 

-- UUT: ALU  
UUT: top_layer
-- ****************************** MAPPING *******************************
PORT MAP(   a_top   => signal_a_net, 
            b_top   => signal_b_net, 
            op_top  => signal_op_net, 
            o_top   => signal_o_net
        ); 
-- ********************************************************************** 

-- ****************************** PROCESS *******************************
Testbench_Desc_Name: PROCESS 
    BEGIN  
        -- ****************************** SUM *******************************
        signal_op_net <= "00"; 
        signal_a_net <= "1000"; 
        signal_b_net <= "1010"; 
        WAIT FOR 250 NS; 

        signal_op_net <= "00"; 
        signal_a_net <= "0011"; 
        signal_b_net <= "0011"; 
        WAIT FOR 250 NS; 
        
        signal_op_net <= "00"; 
        signal_a_net <= "1111"; 
        signal_b_net <= "1100"; 
        WAIT FOR 250 NS; 
        
        signal_op_net <= "00"; 
        signal_a_net <= "1000"; 
        signal_b_net <= "0011"; 
        WAIT FOR 250 NS;
        -- ****************************** SUM *******************************
        
        -- ****************************** SUBSTRACTION *******************************
        signal_op_net <= "01"; 
        signal_a_net <= "1000"; 
        signal_b_net <= "0010"; 
        WAIT FOR 250 NS; 

        signal_op_net <= "01"; 
        signal_a_net <= "0011"; 
        signal_b_net <= "0011"; 
        WAIT FOR 250 NS; 
        
        signal_op_net <= "01"; 
        signal_a_net <= "1111"; 
        signal_b_net <= "1100"; 
        WAIT FOR 250 NS; 
        
        signal_op_net <= "01"; 
        signal_a_net <= "1000"; 
        signal_b_net <= "0011"; 
        WAIT FOR 250 NS;
        -- ****************************** SUBSTRACTION *******************************
        
        -- ****************************** MAXIMUM *******************************
        signal_op_net <= "10"; 
        signal_a_net <= "1011"; 
        signal_b_net <= "1001"; 
        WAIT FOR 250 NS; 

        signal_op_net <= "10"; 
        signal_a_net <= "0011"; 
        signal_b_net <= "0011"; 
        WAIT FOR 250 NS; 
        
        signal_op_net <= "10"; 
        signal_a_net <= "1111"; 
        signal_b_net <= "1100"; 
        WAIT FOR 250 NS; 
        
        signal_op_net <= "10"; 
        signal_a_net <= "1001"; 
        signal_b_net <= "0001"; 
        WAIT FOR 250 NS;
        -- ****************************** MAXIMUM *******************************
        
        -- ****************************** MINIMUN *******************************
        signal_op_net <= "11"; 
        signal_a_net <= "1011"; 
        signal_b_net <= "1001"; 
        WAIT FOR 250 NS; 

        signal_op_net <= "11"; 
        signal_a_net <= "0011"; 
        signal_b_net <= "0011"; 
        WAIT FOR 250 NS; 

        signal_op_net <= "11"; 
        signal_a_net <= "1111"; 
        signal_b_net <= "1100"; 
        WAIT FOR 250 NS; 
        
        signal_op_net <= "11"; 
        signal_a_net <= "1001"; 
        signal_b_net <= "0001"; 
        WAIT FOR 250 NS;
        
        signal_op_net <= "11"; 
        signal_a_net <= "1001"; 
        signal_b_net <= "0001"; 
        WAIT FOR 250 NS;
        -- ****************************** MINIMUN *******************************

        WAIT;  
    END PROCESS; 
END; 
-- ******************************************************************
