
<!-- Avisos gerais antes de começar -->
<!-- 1 - Esse é o vídeo de uma série sobre Swinject, assista os anteriores caso ainda não tenha visto  -->
<!-- 2 - Aconselho que acelere o vídeo em 2x ou mais caso ache que eu esteja explicando de forma lenta -->
<!-- 3 - No meu blog Café do Jovem Stark vai ter um post sobre o conteúdo do vídeo também, dê uma olhada lá caso interesse -->


# 📘 Swinject – Escopos de Objeto (`ObjectScope`) 


## O que é "Escopo" de forma prática?

- Pense no **escopo** como a **vida útil da instância** criada por injeção.

- No Swinject temos os seguintes escopos:
- **`transient`** → vida curta, nova instância sempre.
- **`graph`** → vida curta, mas compartilhada durante a criação de dependências.
- **`container`** → vida longa, vive enquanto o container existir (singleton).
- **`weak`** → vive enquanto alguém usar, depois morre.
- **Custom** → você controla a vida útil.

---


## ✅ 1. O que é um Escopo de Objeto?

No Swinject, um **escopo** define **como e por quanto tempo uma instância criada pelo container será mantida (compartilhada)**.

Por padrão, toda vez que o container resolve um tipo, ele pode:
- Criar uma **nova instância** (sem compartilhar),
- Ou **reaproveitar** uma instância já criada anteriormente.

Isso é configurado usando o método `inObjectScope(...)` na hora de registrar a dependência.

---

## 🧠 2. Como definir um escopo com `inObjectScope`

Exemplo:

```swift
container.register(Animal.self) { _ in Cat() }
    .inObjectScope(.container)
```

Neste exemplo, o Swinject vai manter uma **única instância de `Cat`** enquanto o container existir. Toda vez que você chamar `resolve(Animal.self)`, ele retornará a mesma instância.

---

## ⚠️ 3. Escopos são ignorados para tipos valor

Se o tipo registrado for um **valor** (por exemplo `struct` ou `enum`), o escopo será **ignorado**. Isso acontece porque, por padrão do Swift, tipos valor **não são compartilhados**, mas **copiados** ao serem passados.

---

## 🏗️ 4. Escopos embutidos (built-in)

### 4.1 🔁 `transient` (nova instância sempre)

```swift
.inObjectScope(.transient)
```

- Uma nova instância **sempre será criada**.
- Nada é reaproveitado.
- ⚠️ Circular dependencies **não funcionam bem** aqui, pois não há cache para montar o grafo de objetos.




🧪 **Exemplo prático**:
<!--Cada vez que você abrir uma tela, um novo ViewModel pode ser criado com esse escopo.-->

---

### 4.2 🌐 `graph` (escopo padrão)

```swift
.inObjectScope(.graph)
```

- Cada chamada direta a `resolve` **cria novas instâncias**.
- Mas dentro da cadeia de dependências (ou "grafo") dessa resolução, as instâncias **são compartilhadas**.

🧠 **Explicando**:
Se A depende de B e B depende de C, todas as instâncias de C durante essa resolução são **as mesmas**. Mas, se você resolver A novamente, novas instâncias serão criadas.

---

### 4.3 🧍‍♂️ `container` (singleton do container)

```swift
.inObjectScope(.container)
```

- A **mesma instância** é usada **em todas as resoluções** daquele tipo no container.
- Funciona como um **singleton**, mas controlado pelo container.

🧪 **Exemplo prático**:
Um serviço de login que mantém o usuário logado na memória: `UserSessionService`.

---

### 4.4 🫥 `weak` (instância fraca, descartável)

```swift
.inObjectScope(.weak)
```

- A instância é **compartilhada** enquanto **alguém mais tiver uma referência forte** a ela.
- Quando ninguém mais estiver usando, o container **descarta** e cria uma nova na próxima resolução.

🧠 Útil para evitar **retenção de memória** desnecessária.

🧪 **Exemplo prático**:
Serviços que são usados rapidamente e não precisam viver muito tempo, como `AnalyticsTracker`.

---

## 🛠️ 5. Escopos Personalizados (Custom Scopes)

### 5.1 Como criar um escopo customizado

```swift
extension ObjectScope {
    static let custom = ObjectScope(storageFactory: PermanentStorage.init)
}
```

Você pode criar escopos com comportamentos específicos. Esse acima se comporta como `.container`.

---

### 5.2 Como resetar um escopo customizado

```swift
container.resetObjectScope(.custom)
```

Isso faz o container **descartar a instância compartilhada**. Na próxima resolução, **uma nova instância será criada**.

---

### 5.3 Como alterar o comportamento com `storageFactory` ou `ObjectScopeProtocol`

Você pode ir além e definir o **comportamento de cache/memória** das instâncias, implementando seu próprio `ObjectScopeProtocol` ou usando diferentes estratégias de armazenamento (`storageFactory`).

---

## 🎯 Dica Final

Use escopos para:
- **Evitar criar instâncias desnecessárias**
- **Controlar ciclos de dependência**
- **Aumentar performance** ao reaproveitar instâncias
- **Gerenciar memória** com mais segurança
