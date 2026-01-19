// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract HelloWorld {

    int8 private _age = 34; // signed integer = -128 a +127
    // por convenção, underline para nomear variável privada

    uint8 public age2 = 34; // unsigned integer = 0 a 255
    // não existe ponto flutuante no Solidity (float, double, nada disso)
    // apenas inteiros
    // números quebrados são apenas lógicas de exibição no frontend

    string public message = "Hello World!";

    address public wallet = 0x26Ae8329D82bEdb842dF0581E35475545C3085c7;

    bool public isValid = false; // true ou false (que vai virar 0 ou 1)

    // bytes1 e suas variações

    enum Chave { ON, OFF }

    Chave public status = Chave.OFF;
    Chave public status2 = Chave.ON;

    // Modificadores de acesso ( POR DEFAULT ADOTA INTERNAL )
    // public (getters automáticos, acesso a todos)
    // private ("kind of", acesso exclusivo deste contrato)
    // external (acesso somente externo, usado somente em funções)
    // internal (default, "protected", acessível por contratos herdeiros)

    // Quando a variável é public, automaticamente o Solidity gera uma 
    // função para a leitura do dado

}