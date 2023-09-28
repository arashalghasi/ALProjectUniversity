page 50127 DemoPageArash
{
    Caption = 'Demo Render HTML';

    layout
    {
        area(Content)
        {
            usercontrol(html; HTML)
            {
                ApplicationArea = all;
                trigger ControlReady()
                begin
                    CurrPage.html.Render('<main><section><h2>About Us</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ac justo vel libero malesuada aliquam.</p></section><section><h2>Services</h2><ul><li>Web Design</li><li>Graphic Design</li><li>SEO</li></ul></section></main>');

                end;
            }
        }
    }
}