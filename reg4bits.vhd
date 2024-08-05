library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg4bit is
    Port (
        clk     : in  STD_LOGIC;       -- Clock
        reset   : in  STD_LOGIC;       -- Reset assíncrono
        load    : in  STD_LOGIC;       -- Sinal de controle para carregar novo valor
        d       : in  STD_LOGIC_VECTOR(3 downto 0); -- Dados de entrada de 4 bits
        q       : out STD_LOGIC_VECTOR(3 downto 0)  -- Dados de saída de 4 bits
    );
end reg4bit;

architecture Behavioral of reg4bit is
    signal reg : STD_LOGIC_VECTOR(3 downto 0); -- Registrador interno de 4 bits
begin

    process(clk, reset)
    begin
        if reset = '1' then
            reg <= (others => '0'); -- Reset assíncrono: coloca todos os bits em 0
        elsif rising_edge(clk) then
            if load = '1' then
                reg <= d; -- Carrega novo valor quando load é ativado
            end if;
        end if;
    end process;

    q <= reg; -- Saída é o valor do registrador

end Behavioral;
