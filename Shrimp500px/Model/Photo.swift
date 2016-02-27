//
//  Photo.swift
//  Shrimp500px
//
//  Created by 振亮 孙 on 16/2/27.
//  Copyright © 2016年 papa.studio. All rights reserved.
//

import Foundation
//
//struct Photo {
//	let currentPage: Int
//	let feature: String
//	struct Filters {
//		let category: Bool
//		let exclude: Bool
//		static func fromJSONDictionary(info: [String: AnyObject]) -> Filters? {
//			guard let category = info["category"] as? Bool else { return nil }
//			guard let exclude = info["exclude"] as? Bool else { return nil }
//			return Filters(category: category, exclude: exclude)
//		}
//	}
//	let filters: Filters
//	struct Photo {
//		let aperture: String
//		let camera: String
//		let category: Int
//		let collectionsCount: Int
//		let commentsCount: Int
//		let converted: Int
//		let convertedBits: Int
//		let createdAt: String
//		let cropVersion: Int
//		let description: String
//		let disliked: Bool
//		let favorited: Bool
//		let favoritesCount: Int
//		let focalLength: String
//		let forSale: Bool
//		let forSaleDate: UnknownType?
//		let height: Int
//		let hiResUploaded: Int
//		let highestRating: Int
//		let highestRatingDate: UnknownType?
//		let id: Int
//		let imageFormat: String
//		let imageUrl: String
//		struct Image {
//			let format: String
//			let httpsUrl: String
//			let size: Int
//			let url: String
//			static func fromJSONDictionary(info: [String: AnyObject]) -> Image? {
//				guard let format = info["format"] as? String else { return nil }
//				guard let httpsUrl = info["https_url"] as? String else { return nil }
//				guard let size = info["size"] as? Int else { return nil }
//				guard let url = info["url"] as? String else { return nil }
//				return Image(format: format, httpsUrl: httpsUrl, size: size, url: url)
//			}
//		}
//		let images: [Image]
//		let iso: String
//		let latitude: Double
//		let lens: UnknownType?
//		let licenseRequestsEnabled: Bool
//		let licenseType: Int
//		let licensingRequested: Bool
//		let liked: Bool
//		let location: UnknownType?
//		let longitude: Double
//		let name: String
//		let nsfw: Bool
//		let positiveVotesCount: Int
//		let privacy: Bool
//		let profile: Bool
//		let purchased: Bool
//		let rating: Int
//		let requestToBuyEnabled: Bool
//		let salesCount: Int
//		let shutterSpeed: String
//		let status: Int
//		let storeDownload: Bool
//		let storeLicense: Bool
//		let storePrint: Bool
//		let takenAt: String
//		let timesViewed: Int
//		let url: String
//		struct User {
//			let affection: Int
//			struct Avatars {
//				struct Default {
//					let https: String
//					static func fromJSONDictionary(info: [String: AnyObject]) -> Default? {
//						guard let https = info["https"] as? String else { return nil }
//						return Default(https: https)
//					}
//				}
//				let default: Default
//				struct Large {
//					let https: String
//					static func fromJSONDictionary(info: [String: AnyObject]) -> Large? {
//						guard let https = info["https"] as? String else { return nil }
//						return Large(https: https)
//					}
//				}
//				let large: Large
//				struct Small {
//					let https: String
//					static func fromJSONDictionary(info: [String: AnyObject]) -> Small? {
//						guard let https = info["https"] as? String else { return nil }
//						return Small(https: https)
//					}
//				}
//				let small: Small
//				struct Tiny {
//					let https: String
//					static func fromJSONDictionary(info: [String: AnyObject]) -> Tiny? {
//						guard let https = info["https"] as? String else { return nil }
//						return Tiny(https: https)
//					}
//				}
//				let tiny: Tiny
//				static func fromJSONDictionary(info: [String: AnyObject]) -> Avatars? {
//					guard let defaultJSONDictionary = info["default"] as? [String: AnyObject] else { return nil }
//					guard let default = Default.fromJSONDictionary(defaultJSONDictionary) else { return nil }
//					guard let largeJSONDictionary = info["large"] as? [String: AnyObject] else { return nil }
//					guard let large = Large.fromJSONDictionary(largeJSONDictionary) else { return nil }
//					guard let smallJSONDictionary = info["small"] as? [String: AnyObject] else { return nil }
//					guard let small = Small.fromJSONDictionary(smallJSONDictionary) else { return nil }
//					guard let tinyJSONDictionary = info["tiny"] as? [String: AnyObject] else { return nil }
//					guard let tiny = Tiny.fromJSONDictionary(tinyJSONDictionary) else { return nil }
//					return Avatars(default: default, large: large, small: small, tiny: tiny)
//				}
//			}
//			let avatars: Avatars
//			let city: String
//			let country: String
//			let coverUrl: UnknownType?
//			let firstname: String
//			let followersCount: Int
//			let fullname: String
//			let id: Int
//			let lastname: String
//			let storeOn: Bool
//			let upgradeStatus: Int
//			let username: String
//			let userpicHttpsUrl: String
//			let userpicUrl: String
//			let usertype: Int
//			static func fromJSONDictionary(info: [String: AnyObject]) -> User? {
//				guard let affection = info["affection"] as? Int else { return nil }
//				guard let avatarsJSONDictionary = info["avatars"] as? [String: AnyObject] else { return nil }
//				guard let avatars = Avatars.fromJSONDictionary(avatarsJSONDictionary) else { return nil }
//				guard let city = info["city"] as? String else { return nil }
//				guard let country = info["country"] as? String else { return nil }
//				let coverUrl = info["cover_url"] as? UnknownType
//				guard let firstname = info["firstname"] as? String else { return nil }
//				guard let followersCount = info["followers_count"] as? Int else { return nil }
//				guard let fullname = info["fullname"] as? String else { return nil }
//				guard let id = info["id"] as? Int else { return nil }
//				guard let lastname = info["lastname"] as? String else { return nil }
//				guard let storeOn = info["store_on"] as? Bool else { return nil }
//				guard let upgradeStatus = info["upgrade_status"] as? Int else { return nil }
//				guard let username = info["username"] as? String else { return nil }
//				guard let userpicHttpsUrl = info["userpic_https_url"] as? String else { return nil }
//				guard let userpicUrl = info["userpic_url"] as? String else { return nil }
//				guard let usertype = info["usertype"] as? Int else { return nil }
//				return User(affection: affection, avatars: avatars, city: city, country: country, coverUrl: coverUrl, firstname: firstname, followersCount: followersCount, fullname: fullname, id: id, lastname: lastname, storeOn: storeOn, upgradeStatus: upgradeStatus, username: username, userpicHttpsUrl: userpicHttpsUrl, userpicUrl: userpicUrl, usertype: usertype)
//			}
//		}
//		let user: User
//		let userId: Int
//		let voted: Bool
//		let votesCount: Int
//		let watermark: Bool
//		let width: Int
//		static func fromJSONDictionary(info: [String: AnyObject]) -> Photo? {
//			guard let aperture = info["aperture"] as? String else { return nil }
//			guard let camera = info["camera"] as? String else { return nil }
//			guard let category = info["category"] as? Int else { return nil }
//			guard let collectionsCount = info["collections_count"] as? Int else { return nil }
//			guard let commentsCount = info["comments_count"] as? Int else { return nil }
//			guard let converted = info["converted"] as? Int else { return nil }
//			guard let convertedBits = info["converted_bits"] as? Int else { return nil }
//			guard let createdAt = info["created_at"] as? String else { return nil }
//			guard let cropVersion = info["crop_version"] as? Int else { return nil }
//			guard let description = info["description"] as? String else { return nil }
//			guard let disliked = info["disliked"] as? Bool else { return nil }
//			guard let favorited = info["favorited"] as? Bool else { return nil }
//			guard let favoritesCount = info["favorites_count"] as? Int else { return nil }
//			guard let focalLength = info["focal_length"] as? String else { return nil }
//			guard let forSale = info["for_sale"] as? Bool else { return nil }
//			let forSaleDate = info["for_sale_date"] as? UnknownType
//			guard let height = info["height"] as? Int else { return nil }
//			guard let hiResUploaded = info["hi_res_uploaded"] as? Int else { return nil }
//			guard let highestRating = info["highest_rating"] as? Int else { return nil }
//			let highestRatingDate = info["highest_rating_date"] as? UnknownType
//			guard let id = info["id"] as? Int else { return nil }
//			guard let imageFormat = info["image_format"] as? String else { return nil }
//			guard let imageUrl = info["image_url"] as? String else { return nil }
//			guard let imagesJSONArray = info["images"] as? [[String: AnyObject]] else { return nil }
//			let images = imagesJSONArray.map({ Image.fromJSONDictionary($0) }).flatMap({ $0 })
//			guard let iso = info["iso"] as? String else { return nil }
//			guard let latitude = info["latitude"] as? Double else { return nil }
//			let lens = info["lens"] as? UnknownType
//			guard let licenseRequestsEnabled = info["license_requests_enabled"] as? Bool else { return nil }
//			guard let licenseType = info["license_type"] as? Int else { return nil }
//			guard let licensingRequested = info["licensing_requested"] as? Bool else { return nil }
//			guard let liked = info["liked"] as? Bool else { return nil }
//			let location = info["location"] as? UnknownType
//			guard let longitude = info["longitude"] as? Double else { return nil }
//			guard let name = info["name"] as? String else { return nil }
//			guard let nsfw = info["nsfw"] as? Bool else { return nil }
//			guard let positiveVotesCount = info["positive_votes_count"] as? Int else { return nil }
//			guard let privacy = info["privacy"] as? Bool else { return nil }
//			guard let profile = info["profile"] as? Bool else { return nil }
//			guard let purchased = info["purchased"] as? Bool else { return nil }
//			guard let rating = info["rating"] as? Int else { return nil }
//			guard let requestToBuyEnabled = info["request_to_buy_enabled"] as? Bool else { return nil }
//			guard let salesCount = info["sales_count"] as? Int else { return nil }
//			guard let shutterSpeed = info["shutter_speed"] as? String else { return nil }
//			guard let status = info["status"] as? Int else { return nil }
//			guard let storeDownload = info["store_download"] as? Bool else { return nil }
//			guard let storeLicense = info["store_license"] as? Bool else { return nil }
//			guard let storePrint = info["store_print"] as? Bool else { return nil }
//			guard let takenAt = info["taken_at"] as? String else { return nil }
//			guard let timesViewed = info["times_viewed"] as? Int else { return nil }
//			guard let url = info["url"] as? String else { return nil }
//			guard let userJSONDictionary = info["user"] as? [String: AnyObject] else { return nil }
//			guard let user = User.fromJSONDictionary(userJSONDictionary) else { return nil }
//			guard let userId = info["user_id"] as? Int else { return nil }
//			guard let voted = info["voted"] as? Bool else { return nil }
//			guard let votesCount = info["votes_count"] as? Int else { return nil }
//			guard let watermark = info["watermark"] as? Bool else { return nil }
//			guard let width = info["width"] as? Int else { return nil }
//			return Photo(aperture: aperture, camera: camera, category: category, collectionsCount: collectionsCount, commentsCount: commentsCount, converted: converted, convertedBits: convertedBits, createdAt: createdAt, cropVersion: cropVersion, description: description, disliked: disliked, favorited: favorited, favoritesCount: favoritesCount, focalLength: focalLength, forSale: forSale, forSaleDate: forSaleDate, height: height, hiResUploaded: hiResUploaded, highestRating: highestRating, highestRatingDate: highestRatingDate, id: id, imageFormat: imageFormat, imageUrl: imageUrl, images: images, iso: iso, latitude: latitude, lens: lens, licenseRequestsEnabled: licenseRequestsEnabled, licenseType: licenseType, licensingRequested: licensingRequested, liked: liked, location: location, longitude: longitude, name: name, nsfw: nsfw, positiveVotesCount: positiveVotesCount, privacy: privacy, profile: profile, purchased: purchased, rating: rating, requestToBuyEnabled: requestToBuyEnabled, salesCount: salesCount, shutterSpeed: shutterSpeed, status: status, storeDownload: storeDownload, storeLicense: storeLicense, storePrint: storePrint, takenAt: takenAt, timesViewed: timesViewed, url: url, user: user, userId: userId, voted: voted, votesCount: votesCount, watermark: watermark, width: width)
//		}
//	}
//	let photos: [Photo]
//	let totalItems: Int
//	let totalPages: Int
//	static func fromJSONDictionary(info: [String: AnyObject]) -> Photo? {
//		guard let currentPage = info["current_page"] as? Int else { return nil }
//		guard let feature = info["feature"] as? String else { return nil }
//		guard let filtersJSONDictionary = info["filters"] as? [String: AnyObject] else { return nil }
//		guard let filters = Filters.fromJSONDictionary(filtersJSONDictionary) else { return nil }
//		guard let photosJSONArray = info["photos"] as? [[String: AnyObject]] else { return nil }
//		let photos = photosJSONArray.map({ Photo.fromJSONDictionary($0) }).flatMap({ $0 })
//		guard let totalItems = info["total_items"] as? Int else { return nil }
//		guard let totalPages = info["total_pages"] as? Int else { return nil }
//		return Photo(currentPage: currentPage, feature: feature, filters: filters, photos: photos, totalItems: totalItems, totalPages: totalPages)
//	}
//}