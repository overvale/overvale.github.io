function wrapCharacters(selector, characters, className) {
    const targets = document.querySelectorAll(selector);
    const characterSet = new Set(characters);

    for (const target of targets) {
        const walker = document.createTreeWalker(target, NodeFilter.SHOW_TEXT);
        const textNodes = [];

        while (walker.nextNode()) {
            const parent = walker.currentNode.parentElement;
            if (parent?.classList.contains(className)) continue;
            textNodes.push(walker.currentNode);
        }

        for (const textNode of textNodes) {
            const text = textNode.nodeValue;
            if (![...text].some((character) => characterSet.has(character))) continue;

            const fragment = document.createDocumentFragment();

            for (const character of text) {
                if (characterSet.has(character)) {
                    const span = document.createElement("span");
                    span.className = className;
                    span.textContent = character;
                    fragment.appendChild(span);
                } else {
                    fragment.appendChild(document.createTextNode(character));
                }
            }

            textNode.replaceWith(fragment);
        }
    }
}

document.addEventListener("DOMContentLoaded", () => {
    wrapCharacters("h1, h2, h3, h4, h5, h6", ["&"], "char-amp");
});
