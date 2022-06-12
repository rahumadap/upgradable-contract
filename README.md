**Seguridad - Contratos "actualizables"**

Ejemplo simple:

* Contrato Storage.sol registra la estructura de almacenamiento (variables).
* Se crea un contrato Proxy.sol que hereda la estructura de almacenamiento desde Storage.sol. Toda variable de estado será almacenada en Proxy.
* Contrato Tokens.sol contiene la lógica de funcionalidad y también hereda desde Storage.
* Si hay errores en Tokens.sol, éste puede ser reemplazado por uno nuevo y Proxy apuntará a las funcionalidades del nuevo contrato.
