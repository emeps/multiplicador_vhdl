library ieee;
use ieee.std_logic_1164.all;

entity shift_register_8bit is
    port (
        clk         : in  std_logic;
        reset       : in  std_logic;
        load        : in  std_logic;
        shift_right : in  std_logic;
        clear       : in  std_logic;
        data_in     : in  std_logic_vector(7 downto 0);
        data_out    : out std_logic_vector(7 downto 0)
    );
end shift_register_8bit;

architecture Behavioral of shift_register_8bit is
    signal reg : std_logic_vector(7 downto 0);
begin

    process(clk, reset)
    begin
        if reset = '1' then
            reg <= (others => '0');
        elsif rising_edge(clk) then
            if clear = '1' then
                reg <= (others => '0');
            elsif load = '1' then
                reg <= data_in;
            elsif shift_right = '1' then
                reg <= '0' & reg(7 downto 1);
            end if;
        end if;
    end process;

    data_out <= reg;

end Behavioral;
