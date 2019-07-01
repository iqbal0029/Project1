//
//  Project1Tests.swift
//  Project1Tests
//
//  Created by Faisal Ikwal on 03/06/19.
//  Copyright © 2019 Exilant Technologies. All rights reserved.
//

import XCTest
@testable import Project1

class Project1Tests: XCTestCase {

    func testLoadingImages() {
        // given
        let sut = ViewController()

        // when
        sut.loadViewIfNeeded()

        // then
        XCTAssertEqual(sut.pictures.count, 10, "There should be ten pictures.")
    }

    func testTableExists() {
        // given
        let sut = ViewController()

        // when
        sut.loadViewIfNeeded()

        // then
        XCTAssertNotNil(sut.tableView)
    }

    func testTableViewHasCorrectRowCount() {
        // given
        let sut = ViewController()
        // when
        sut.loadViewIfNeeded()
        // then
        let rowCount = sut.tableView(sut.tableView,
                                     numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, sut.pictures.count)
    }

    func testEachCellHasTheCorrectText() {
        // given
        let sut = ViewController()
        // when
        sut.loadViewIfNeeded()
        // then
        for (index, picture) in sut.pictures.enumerated() {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt:
                indexPath)
            XCTAssertEqual(cell.textLabel?.text, picture)
        }
    }

    func testCellsHaveDisclosureIndicators() {
        // given
        let sut = ViewController()

        // when
        sut.loadViewIfNeeded()

        // then
        for index in sut.pictures.indices {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt:
                indexPath)
            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }

    func testViewControllerUsesLargeTitles() {
        // given
        let sut = ViewController()
        _ = UINavigationController(rootViewController: sut)

        // when
        sut.loadViewIfNeeded()

        // then
        XCTAssertTrue(sut.navigationController?.navigationBar.prefersLargeTitles ?? false)
    }

    func testNavigationBarHasStormViewerTitle() {
        // given
        let sut = ViewController()

        // when
        sut.loadViewIfNeeded()

        // then
        XCTAssertEqual(sut.title, "Storm Viewer")
    }

    func testDetailImageViewExists() {
        // given
        let sut = DetailViewController()

        // when
        sut.loadViewIfNeeded()

        // then
        XCTAssertNotNil(sut.imageView)
    }

    func testDetailViewIsImageView() {
        // given
        let sut = DetailViewController()

        // when
        sut.loadViewIfNeeded()

        // then
        XCTAssertEqual(sut.view, sut.imageView)
    }

    func testDetailLoadsImage() {
        // given
        let filenameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: filenameToTest, in:
            Bundle.main, compatibleWith: nil)
        let sut = DetailViewController()
        sut.selectedImage = filenameToTest

        // when
        sut.loadViewIfNeeded()

        // then
        XCTAssertEqual(sut.imageView.image, imageToLoad)
    }

    func testSelectingImageShowsDetail() {
        // given
        let sut = ViewController()
        var selectedImage: String?
        let testIndexPath = IndexPath(row: 0, section: 0)
        
        // when
        sut.pictureSelectAction = {
            selectedImage = $0
        }
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)

        // then
        XCTAssertEqual(selectedImage, "nssl0049.jpg")
    }

    func testSelectingImageShowsDetailImage() {
        // given
        let sut = ViewController()
        let testIndexPath = IndexPath(row: 0, section: 0)
        let filenameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: filenameToTest, in:
            Bundle.main, compatibleWith: nil)

        // when
        sut.pictureSelectAction = {
            let detail = DetailViewController()
            detail.selectedImage = $0
            detail.loadViewIfNeeded()
            XCTAssertEqual(detail.imageView.image, imageToLoad)
        }
        
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
    }
}
