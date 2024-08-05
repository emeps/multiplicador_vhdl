library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder4bit is
    Port (
        a       : in  STD_LOGIC_VECTOR(3 downto 0); -- Primeiro operando de 4 bits
        b       : in  STD_LOGIC_VECTOR(3 downto 0); -- Segundo operando de 4 bits
        cin     : in  STD_LOGIC;                    -- Carry-in
        sum     : out STD_LOGIC_VECTOR(3 downto 0); -- Soma de 4 bits
        cout    : out STD_LOGIC                     -- Carry-out
    );
end adder4bit;

architecture Behavioral of adder4bit is
begin
    process(a, b, cin)
        variable temp_sum : STD_LOGIC_VECTOR(4 downto 0); -- Vetor temporário de 5 bits para armazenar a soma completa
    begin
        temp_sum := ('0' & a) + ('0' & b) + cin; -- Realiza a soma incluindo o carry-in
        sum <= temp_sum(3 downto 0);             -- Atribui os 4 bits menos significativos à saída sum
        cout <= temp_sum(4);                     -- Atribui o bit mais significativo à saída cout
    end process;
end Behavioral;
