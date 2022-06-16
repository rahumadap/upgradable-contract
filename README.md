**Seguridad - Contratos "actualizables"**

Ejemplo simple:

* Contrato Storage.sol registra la estructura de almacenamiento (variables).
* Se crea un contrato Proxy.sol que hereda la estructura de almacenamiento desde Storage.sol. Toda variable de estado será almacenada en Proxy.
* Contrato Tokens.sol contiene la lógica de funcionalidad y también hereda desde Storage.
* Si hay errores en Tokens.sol, éste puede ser reemplazado por uno nuevo y Proxy apuntará a las funcionalidades del nuevo contrato.

Ejemplo avanzado:

* Storage guarda las variables genéricas en un mapping por cada tipo de dato. De esta forma, se pueden crear infinitas nuevas variables, haciendo más flexible la programación.
* Tokens contiene todas las funciiones que Proxy necesita. Todo se ejecuta en el ámbito de Proxy.
* Proxy es el contrato intermediario entre Storage y la funcionalidad que entrega "Tokens". Su función "Upgrade" permite cambiar la dirección del contrato que se quiere modificar [Tokens.sol => TokensUpdated.sol]. La función Fallback permite ejecutar cualquier función que se requiera en Tokens o adicionales en un contrato actualizado.
* Proxy es lo que interactúa con el usuario.
