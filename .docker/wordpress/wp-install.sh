#!/bin/bash

# WordPressの標準インストール処理
# ※--admin_password='password'の行を削除するとパスワードを自動生成(ターミナルに表示される)
wp core install \
--url='http://localhost:8080/wp/' \
--title='サイトのタイトル' \
--admin_user='admin' \
--admin_password='password' \
--admin_email='info@cab-net.jp' \
--skip-email \
--allow-root

# サイトの言語設定
wp language core install 'ja' --activate --allow-root

# 編集者ユーザーを作成(ユーザー名、メール、パスワードは適宜変更)
# ※--user_pass='password'を削除するとパスワードを自動生成(ターミナルに表示される)
wp user create 'editor_user' 'postmaster@cab-net.jp' --user_pass='password' --role='editor' --allow-root

# キャッチフレーズの設定(必要なら記入)
wp option update blogdescription '' --allow-root

# 不要なインストール済みプラグインを削除
wp plugin delete hello.php --allow-root
wp plugin delete akismet --allow-root

# 初期プラグインのインストール(必要に応じてコメントアウト)
wp plugin install wp-multibyte-patch --activate --allow-root
wp plugin install all-in-one-wp-migration --activate --allow-root
wp plugin install wp-head-cleaner --activate --allow-root

# 投稿/カテゴリー関連プラグイン
wp plugin install advanced-schedule-posts --activate --allow-root
wp plugin install intuitive-custom-post-order --activate --allow-root
wp plugin install public-post-preview --activate --allow-root

# テーマ/テンプレート関連プラグイン
wp plugin install breadcrumb-navxt --activate --allow-root
wp plugin install wp-pagenavi --activate --allow-root

# 管理画面カスタマイズ関連プラグイン
wp plugin install wp-total-hacks --activate --allow-root
wp plugin install admin-menu-editor --activate --allow-root
wp plugin install radio-buttons-for-taxonomies --activate --allow-root
wp plugin install peters-login-redirect --allow-root

# エディター関連プラグイン
wp plugin install tinymce-advanced --activate --allow-root
wp plugin install classic-editor --activate --allow-root
wp plugin install html-editor-syntax-highlighter --activate --allow-root

# メディア関連プラグイン
wp plugin install ewww-image-optimizer --activate --allow-root
wp plugin install enable-media-replace --activate --allow-root

# カスタム投稿タイプ関連プラグイン
wp plugin install custom-post-type-ui --activate --allow-root
wp plugin install custom-post-type-permalinks --activate --allow-root

# REST API関連プラグイン
wp plugin install acf-to-rest-api --activate --allow-root

# セキュリティ・バックアップ関連プラグイン
wp plugin install siteguard --allow-root
wp plugin install backwpup --allow-root

# 有料版プラグイン(zipファイルからインストール)を有効化
# https://cab-work.backlog.jp/alias/wiki/89675
wp plugin activate advanced-custom-fields-pro --allow-root
wp plugin activate admin-columns-pro --allow-root
wp plugin activate ac-addon-acf --allow-root

# サイトを見るときにツールバーを表示する設定を解除
wp user meta update 1 show_admin_bar_front false --allow-root

# タイムゾーンと日付/日時形式設定
wp option update timezone_string 'Asia/Tokyo' --allow-root
wp option update date_format 'Y年n月j日' --allow-root
wp option update time_format 'H:i:s' --allow-root

# ディスカッション設定
wp option update default_ping_status 'closed' --allow-root
wp option update default_pingback_flag 0 --allow-root
wp option update default_comment_status 'closed' --allow-root
wp option update moderation_notify 0 --allow-root
wp option update comments_notify 0 --allow-root

# メディア設定
wp option update thumbnail_size_w 400 --allow-root
wp option update thumbnail_size_h 400 --allow-root
wp option update medium_size_w 800 --allow-root
wp option update medium_size_h 800 --allow-root
wp option update large_size_w 1280 --allow-root
wp option update large_size_h 1280 --allow-root
wp option update medium_large_size_w 0 --allow-root

# パーマリンク設定
wp option update permalink_structure '/%category%/%post_id%' --allow-root

# テーマの削除(最新の1つは残す)
#wp theme delete twentysixteen --allow-root
#wp theme delete twentyseventeen --allow-root
#wp theme delete twentynineteen --allow-root
wp theme delete twentytwenty --allow-root
wp theme delete twentytwentyone --allow-root
#wp theme delete twentytwentytwo --allow-root

# プラグイン設定
# wp-head-cleaner
wp option add wp_head_cleaner_hooks '{"0":"rsd_link", "1":"wlwmanifest_link","2": "wp_generator","3": "start_post_rel_link", "4":"index_rel_link", "5":"adjacent_posts_rel_link_wp_head", "6":"wp_shortlink_wp_head", "7":"rel_canonical", "8":"feed_links", "9":"feed_links_extra", "10":"print_emoji_detection_script", "11":"print_emoji_styles", "12":"rest_output_link_wp_head", "13":"wp_oembed_add_discovery_links", "14":"wp_oembed_add_host_js", "15": "wp_resource_hints", "16":"wp_robots_max_image_preview_large"}' --format=json --allow-root

# wp-total-hacks
wp option add wfb_revision 20 --allow-root
wp option add wfb_selfping 1 --allow-root
wp option add wfb_login_logo '/wp/wp-content/themes/sample/logo.svg' --allow-root
wp option add wfb_login_url '/' --allow-root
wp option add wfb_remove_more 1 --allow-root
wp option add wfb_contact_methods '{"0":"aim", "1":"yim", "2":"jabber"}' --format=json --allow-root
wp option add wfb_remove_excerpt 1 --allow-root
wp option add wfb_update_notification 1 --allow-root
wp option add wfb_createpagefordraft 1 --allow-root
wp option add wfb_disallow_pingback 1 --allow-root

# tinymce-advanced
wp option add tadv_version 5600 --allow-root
wp option add tadv_admin_settings '{"options":"classic_paragraph_block,no_autop,table_resize_bars,table_grid,table_tab_navigation,table_advtab","disabled_editors":""}' --format=json --allow-root
wp option add tadv_settings '{"toolbar_1":"styleselect,fontsizeselect,forecolor,backcolor,bold,italic,underline,superscript,subscript,blockquote,strikethrough,bullist,numlist,alignleft,aligncenter,alignright,link,unlink,table,undo,redo,removeformat","toolbar_2":"","toolbar_3":"","toolbar_4":"","toolbar_classic_block":"formatselect,bold,italic,blockquote,bullist,numlist,alignleft,aligncenter,alignright,link,forecolor,backcolor,table,wp_help","toolbar_block":"core\/code,core\/image,core\/strikethrough,tadv\/mark,tadv\/removeformat","toolbar_block_side":"core\/superscript,core\/subscript,core\/underline","panels_block":"tadv\/color-panel,tadv\/background-color-panel","options":"menubar_block,merge_toolbars","plugins":"table"}' --format=json --allow-root

# 初期構築時のカスタム投稿タイプ作成
# post-type1、カスタム投稿1、menu_iconを適宜変更する
wp option add cptui_post_types '{"post-type1":{"name":"post-type1","label":"カスタム投稿1","singular_label":"カスタム投稿1","description":"","public":"true","publicly_queryable":"true","show_ui":"true","show_in_nav_menus":"true","delete_with_user":"false","show_in_rest":"true","rest_base":"","rest_controller_class":"","rest_namespace":"","has_archive":"true","has_archive_string":"","exclude_from_search":"false","capability_type":"post","hierarchical":"false","can_export":"false","rewrite":"true","rewrite_slug":"","rewrite_withfront":"true","query_var":"true","query_var_slug":"","menu_position":"","show_in_menu":"true","show_in_menu_string":"","menu_icon":"","register_meta_box_cb":null,"supports":["title","editor","thumbnail"],"taxonomies":[],"labels":{"menu_name":"","all_items":"","add_new":"","add_new_item":"","edit_item":"","new_item":"","view_item":"","view_items":"","search_items":"","not_found":"","not_found_in_trash":"","parent_item_colon":"","featured_image":"","set_featured_image":"","remove_featured_image":"","use_featured_image":"","archives":"","insert_into_item":"","uploaded_to_this_item":"","filter_items_list":"","items_list_navigation":"","items_list":"","attributes":"","name_admin_bar":"","item_published":"","item_published_privately":"","item_reverted_to_draft":"","item_scheduled":"","item_updated":""},"custom_supports":"","enter_title_here":""}}' --format=json --allow-root

# 初期構築時のカスタムタクソノミー作成
# post-type1、カテゴリーを適宜変更する
wp option add cptui_taxonomies '{"post-type1_category":{"name":"post-type1_category","label":"カテゴリー","singular_label":"カテゴリー","description":"","public":"true","publicly_queryable":"true","hierarchical":"true","show_ui":"true","show_in_menu":"true","show_in_nav_menus":"true","query_var":"true","query_var_slug":"","rewrite":"true","rewrite_slug":"","rewrite_withfront":"1","rewrite_hierarchical":"0","show_admin_column":"false","show_in_rest":"true","show_tagcloud":"false","sort":"false","show_in_quick_edit":"","rest_base":"","rest_controller_class":"","rest_namespace":"","labels":{"menu_name":"","all_items":"","edit_item":"","view_item":"","update_item":"","add_new_item":"","new_item_name":"","parent_item":"","parent_item_colon":"","search_items":"","popular_items":"","separate_items_with_commas":"","add_or_remove_items":"","choose_from_most_used":"","not_found":"","no_terms":"","items_list_navigation":"","items_list":"","back_to_items":"","name_field_description":"","parent_field_description":"","slug_field_description":"","desc_field_description":""},"meta_box_cb":"","default_term":"","object_types":["post-type1"]}}' --format=json --allow-root

# マウントしたテーマの有効化(theme名は適宜変更)
# ※自作テーマを有効化する場合は最後に実行する
#wp theme activate 'sample' --allow-root

# インストール後、ルートフォルダ以下の権限を変更
chown -R www-data:www-data /var/www/html
