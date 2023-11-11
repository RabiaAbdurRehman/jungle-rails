describe('example to-do app', () => {
    beforeEach(() => {
      cy.visit("http://localhost:3000/")
    })
    
    it("should navigate to a product detail page", () => {
        cy.get('.products article').first().find('a').click();
        cy.url().should('include', '/products/');
    })
})