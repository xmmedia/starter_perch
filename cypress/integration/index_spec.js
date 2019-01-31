describe('Load Index', function () {
    it('Does the homepage load', function () {
        cy.visit('/');
        cy.get('h1')
            .contains('Example Domain');
    });
});