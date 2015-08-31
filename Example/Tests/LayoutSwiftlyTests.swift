import Quick
import Nimble
import LayoutSwiftly

class LayoutSwiftlyTests: QuickSpec {
    override func spec() {

        describe("when the view is laid out") {

            var view: UIView!
            var leftView, topView, bottomRightView: UIView!
            beforeEach {

                view = UIView(frame: CGRectMake(0.0, 0.0, 400.0, 400.0))
                leftView = UIView()
                topView = UIView()
                bottomRightView = UIView()

                leftView.translatesAutoresizingMaskIntoConstraints = false
                topView.translatesAutoresizingMaskIntoConstraints = false
                bottomRightView.translatesAutoresizingMaskIntoConstraints = false

                view.addSubview(leftView)
                view.addSubview(topView)
                view.addSubview(bottomRightView)

                view.alignViewsHorizontally([leftView, topView, bottomRightView], horizontalSeparations: [20.0, -50.0, 100.0], widths: [50.0, 75.0, 30.0])
                view.alignViewsVertically([topView, leftView, bottomRightView], verticalSeparations: [50.0, 80.0, 20.0, 50.0], heights: [30.0, 0.0, 70.0])

                view.setNeedsLayout()
                view.layoutIfNeeded()
            }

            it("should have the top view above both other views") {

                let topViewBottom = CGRectGetMaxY(topView.frame)
                expect(topViewBottom).to(equal(80.0))
                expect(topViewBottom).to(beLessThan(CGRectGetMinY(leftView.frame)))
                expect(topViewBottom).to(beLessThan(CGRectGetMinY(bottomRightView.frame)))
            }

            it("should place the left view at the left of the bottom view") {

                expect(CGRectGetMinX(leftView.frame)).to(equal(20.0))
                expect(CGRectGetMaxX(leftView.frame)).to(equal(70.0))
                expect(CGRectGetMaxX(leftView.frame)).to(beLessThan(CGRectGetMinX(bottomRightView.frame)))
            }

            it("should place the top view in line with the left view's left side") {

                expect(CGRectGetMinX(leftView.frame)).to(equal(CGRectGetMinX(topView.frame)))
            }

            it("should put the bottom right view below the left view") {

                expect(CGRectGetMinY(bottomRightView.frame)).to(equal(280.0))
            }

            it("should set the left view's height to be 100.0") {

                expect(CGRectGetHeight(leftView.frame)).to(equal(100.0))
            }
        }
    }
}
