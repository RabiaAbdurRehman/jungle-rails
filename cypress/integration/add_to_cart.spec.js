describe('Add to cart', () => {
    beforeEach(() => {
        // Cypress starts out with a blank slate for each test
        // so we must tell it to visit our website with the `cy.visit()` command.
        // Since we want to visit the same URL at the start of all our tests,
        // we include it in our beforeEach function so that it runs before each test
        cy.visit('http://localhost:3000/')
    });

    it('should add a product to the cart and update the count', () => {
         cy.get('.products article').first().should('be.visible').find('button').should('be.visible').click({force: true});
        //  cy.get(':nth-child(4) > div')
        //  .invoke('text')
        //  .should('match', /\d+/);

            // After clicking, verify the cart count has increased by 1
            cy.get('.end-0 > .nav-link').invoke('text').then((text) => {
                expect(text).to.eq(' \n          My Cart (1) ');





    });


});
})
